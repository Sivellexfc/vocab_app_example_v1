import 'package:expandable_tree_menu/expandable_tree_menu.dart';
//import 'package:fluent_ui/fluent_ui.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class vocabularyPage extends StatefulWidget {
  const vocabularyPage({Key? key}) : super(key: key);

  @override
  State<vocabularyPage> createState() => _vocabularyPageState();
}

class _vocabularyPageState extends State<vocabularyPage> {
  Set<String> words = {
    'word',
    'receive',
    'row',
    'mouth',
    'exact',
    'symbol',
    'die',
    'least',
    'trouble',
    'shout',
    'except',
    'wrote',
    'seed',
    'tone',
    'join',
    'suggest',
    'clean',
    'break',
    'lady'
  };

  var keys = {
    'word': 'kelime',
    'word': 'kelime',
    'receive': 'almak',
    'row': 'çiğ',
    'mouth': 'ağız',
    'exact': 'turkish',
    'symbol': 'sembol',
    'die': 'ölmek',
    'least': 'en az',
    'trouble': 'bela',
    'shout': '',
    'except': 'hariç',
    'wrote': 'yazmak',
    'seed': 'tohum',
    'tone': 'ton',
    'join': 'katılmak',
    'suggest': 'önermek',
    'clean': 'temizlemek',
    'break': 'kırmak',
    'lady': 'bayan'
  };

  bool statement_first = false;
  bool statement_second = false;

  String display_sentence_first =
      'I can neither punish him if he does wrong nor reward him if he does right.';
  String display_sentence_second =
      'We must punish the villain who has caused the ruin of Moscow';

  String sentences_first =
      'I can neither punish him if he does wrong nor reward him if he does right.';
  String sentences_second =
      'We must punish the villain who has caused the ruin of Moscow';
  String sentences_first_tr =
      'Ne yanlış yaparsa cezalandırabilirim ne de doğru yaparsa onu ödüllendirebilirim.';
  String sentences_second_tr =
      'Moskova nın yıkılmasına neden olan kötü adamı cezalandırmalıyız.';

  void changeSentences_first() {
    setState(() {
      if (!statement_first) {
        display_sentence_first = sentences_first_tr;
      }
      if (statement_first) {
        display_sentence_first = sentences_first;
      }
      statement_first = !statement_first;
    });
  }

  void changeSentences_second() {
    setState(() {
      if (!statement_second) {
        display_sentence_second = sentences_second_tr;
      }
      if (statement_second) {
        display_sentence_second = sentences_second;
      }
      statement_second = !statement_second;
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
          ),
          Column(
            children: [
              Text(
                '3/148',
                style: GoogleFonts.raleway(
                    fontSize: 16, fontWeight: FontWeight.w200),
              ),
              Text(
                'word',
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
                          display_sentence_first,
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
                          display_sentence_second,
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
              Container(
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
              Gap(10),
              Container(
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
              Gap(10),
              Container(
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
              Gap(10),
              Container(
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
              Gap(10),
            ],
          ) // options
        ],
      ),
    );
  }
}
