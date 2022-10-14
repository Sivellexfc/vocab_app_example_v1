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
  AppData appData = new AppData();
  List<String> OPTIONS = [];
  Color color_0 = Colors.white;
  Color color_1 = Colors.white;
  Color color_2 = Colors.white;
  Color color_3 = Colors.white;
  List<int> OPTION_ARRAY = [];
  int CHAPTER_ONE = 0;
  var currentWords;
  int stage = 0;

  setIncrement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('chapter', 0);
  }

  getIncrement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      CHAPTER_ONE = prefs.getInt('chapter')!;
    });
  }

  int getRandom() {
    var rand = Random();
    int getRandom = rand.nextInt(4);
    return getRandom;
  }

  List<int> getFourRandomArray() {
    color_0 = Colors.white;
    color_1 = Colors.white;
    color_2 = Colors.white;
    color_3 = Colors.white;

    List<int> array = [0, 1, 2, 3];
    List<int> newArray = [];
    var rand = Random();
    for (int i = 0; i < 4; i++) {
      int temp = rand.nextInt(array.length);
      newArray.add(array.elementAt(temp));
      array.removeAt(temp);
    }
    return newArray;
  }

  getOption() {
    OptionsAction.getRandomWordTR(
        appData.words, appData.means, getRandom(), CHAPTER_ONE);
  }

  @override
  void initState() {
    // TODO: implement initState
    setIncrement();
    getIncrement();
    OPTION_ARRAY = getFourRandomArray();
    super.initState();
  }

  void changeSentences_first() {
    if (!appData.statement_first) {
      appData.display_sentence_first = appData.sentences_first_tr;
    }
    if (appData.statement_first) {
      appData.display_sentence_first = appData.sentences_first;
    }
    appData.statement_first = !appData.statement_first;
  }

  void changeSentences_second() {
    if (!appData.statement_second) {
      appData.display_sentence_second = appData.sentences_second_tr;
    }
    if (appData.statement_second) {
      appData.display_sentence_second = appData.sentences_second;
    }
    appData.statement_second = !appData.statement_second;
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
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'synonyms of',
                    style: GoogleFonts.raleway(
                        color: Color(0xFFe32636),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
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
          const Gap(51),
          InkWell(
            onTap: () {
              //changeSentences_first();
            },
            child: Column(
              children: [
                const Divider(height: 0),
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
              //changeSentences_second();
            },
            child: Column(
              children: [
                const Divider(height: 0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(FluentSystemIcons.ic_fluent_chevron_down_filled,
                          size: 20, color: Colors.grey.shade800),
                      const Gap(15),
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
                const Divider(height: 1)
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
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const Icon(
                      FluentSystemIcons.ic_fluent_arrow_right_regular,
                      size: 17,
                    )
                  ],
                ),
              ),
            ),
          ), //more sentences
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (OPTION_ARRAY.elementAt(0) == 0) {
                      setState(() {
                        color_0 = correctOptionsColor;
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 340,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: color_0,
                        border:
                            Border.all(width: 1, color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      OptionsAction.getRandomWordTR(
                          appData.words,
                          appData.means,
                          OPTION_ARRAY.elementAt(0),
                          CHAPTER_ONE),
                      style: GoogleFonts.raleway(),
                    ),
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {
                    if (OPTION_ARRAY.elementAt(1) == 0) {
                      setState(() {
                        color_1 = correctOptionsColor;
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 340,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: color_1,
                        border:
                            Border.all(width: 1, color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      OptionsAction.getRandomWordTR(
                          appData.words,
                          appData.means,
                          OPTION_ARRAY.elementAt(1),
                          CHAPTER_ONE),
                      style: GoogleFonts.raleway(),
                    ),
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {
                    if (OPTION_ARRAY.elementAt(2) == 0) {
                      setState(() {
                        color_2 = correctOptionsColor;
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 340,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: color_2,
                        border:
                            Border.all(width: 1, color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      OptionsAction.getRandomWordTR(
                          appData.words,
                          appData.means,
                          OPTION_ARRAY.elementAt(2),
                          CHAPTER_ONE),
                      style: GoogleFonts.raleway(),
                    ),
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {
                    if (OPTION_ARRAY.elementAt(3) == 0) {
                      setState(() {
                        color_3 = correctOptionsColor;
                      });
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 340,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: color_3,
                        border:
                            Border.all(width: 1, color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      OptionsAction.getRandomWordTR(
                          appData.words,
                          appData.means,
                          OPTION_ARRAY.elementAt(3),
                          CHAPTER_ONE),
                      style: GoogleFonts.raleway(),
                    ),
                  ),
                ),
                //Gap(0),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Text(
                                'Next',
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              const Gap(3),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ) // options
        ],
      ),
    );
  }
}
