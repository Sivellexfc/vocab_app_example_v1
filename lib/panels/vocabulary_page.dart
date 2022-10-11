import 'dart:math';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainpagedeneme/funtions/options.dart';
//import 'package:mainpagedeneme/preferences/shared_preferences.dart';
import 'package:mainpagedeneme/styles/features/features_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data.dart';

class vocabularyPage extends StatefulWidget {
  const vocabularyPage({Key? key}) : super(key: key);

  @override
  State<vocabularyPage> createState() => _vocabularyPageState();
}

class _vocabularyPageState extends State<vocabularyPage> {
  setIncrement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('chapter', 0);
  }

  getIncrement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      CHAPTER_ONE = prefs.getInt('chapter')!;
      if (CHAPTER_ONE == 0) {
        CHAPTER_ONE = 0;
      }
    });
  }

  int getRandom() {
    var rand = Random();
    int getRandom = rand.nextInt(4);
    return getRandom;
  }

  getOption() {
    OptionsAction.getRandomWordTR(
        appData.words, appData.means, getRandom(), CHAPTER_ONE);
  }

  AppData appData = new AppData();
  //OptionsAction optionsAction = new OptionsAction();

  List<String> OPTIONS = [];

  int CHAPTER_ONE = 0;
  var currentWords;
  int stage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setIncrement();
    getIncrement();
  }

  void changeSentences_first() {
    setState(() {
      if (!appData.statement_first) {
        appData.display_sentence_first = appData.sentences_first_tr;
      }
      if (appData.statement_first) {
        appData.display_sentence_first = appData.sentences_first;
      }
      appData.statement_first = !appData.statement_first;
    });
  }

  void changeSentences_second() {
    setState(() {
      if (!appData.statement_second) {
        appData.display_sentence_second = appData.sentences_second_tr;
      }
      if (appData.statement_second) {
        appData.display_sentence_second = appData.sentences_second;
      }
      appData.statement_second = !appData.statement_second;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Icon(FluentSystemIcons.ic_fluent_arrow_left_filled),
                const Gap(3),
                Text(
                  'Main',
                  style: GoogleFonts.raleway(fontSize: 20),
                )
              ],
            ),
          ), //main
          Column(
            children: [
              Text(
                '${CHAPTER_ONE + 1}/${appData.words.length}',
                style: GoogleFonts.raleway(
                    fontSize: 16, fontWeight: FontWeight.w200),
              ),
              Text(
                appData.words.elementAt(CHAPTER_ONE),
                style: GoogleFonts.raleway(
                    fontSize: 40, fontWeight: FontWeight.w700),
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'synonyms of',
                    style: GoogleFonts.raleway(
                        color: Color(0xFFe32636),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    ' abuse, penalize, discipline',
                    style: GoogleFonts.raleway(
                        color: Color(0x7B000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
          Gap(51),
          InkWell(
            onTap: () {
              changeSentences_first();
            },
            child: Column(
              children: [
                Divider(height: 0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(FluentSystemIcons.ic_fluent_chevron_down_filled,
                          size: 20, color: Colors.grey.shade800),
                      Gap(15),
                      Flexible(
                        child: Text(
                          appData.display_sentence_first,
                          style: GoogleFonts.raleway(fontSize: 16),
                          maxLines: 3,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(height: 1)
              ],
            ),
          ), //sentences
          InkWell(
            onTap: () {
              changeSentences_second();
            },
            child: Column(
              children: [
                Divider(height: 0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(FluentSystemIcons.ic_fluent_chevron_down_filled,
                          size: 20, color: Colors.grey.shade800),
                      Gap(15),
                      Flexible(
                        child: Text(
                          appData.display_sentence_second,
                          style: GoogleFonts.raleway(fontSize: 16),
                          maxLines: 3,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(height: 1)
              ],
            ),
          ), // sentences
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'more sentences',
                      style: GoogleFonts.raleway(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      FluentSystemIcons.ic_fluent_arrow_right_regular,
                      size: 17,
                    )
                  ],
                ),
              ),
            ),
          ), //more sentences
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 340,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Cezalandırmak',
                    style: GoogleFonts.raleway(),
                  ),
                ),
              ),
              Gap(10),
              InkWell(
                child: Container(
                  height: 40,
                  width: 340,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Cezalandırmak',
                    style: GoogleFonts.raleway(),
                  ),
                ),
              ),
              Gap(10),
              InkWell(
                child: Container(
                  height: 40,
                  width: 340,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Cezalandırmak',
                    style: GoogleFonts.raleway(),
                  ),
                ),
              ),
              Gap(10),
              InkWell(
                onTap: () {
                  setState(() {
                    OptionsColor = correctOptionsColor;
                    CHAPTER_ONE++;
                    setIncrement();
                  });
                },
                child: Container(
                  height: 40,
                  width: 340,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: OptionsColor,
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Cezalandırmak',
                    style: GoogleFonts.raleway(),
                  ),
                ),
              ),
              Gap(10),
            ],
          ) // options
        ],
      ),
    );
  }
}
