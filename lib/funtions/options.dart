import 'dart:math';

import '';

class OptionsAction {
  static String getRandomWordTR(
      Set words, Set means, int number, int position) {
    String optionWord;

    if (number == 0) {
      return means.elementAt(position);
    } else {
      List<String> newArray = [];
      for (String mean in means) {
        if (mean != means.elementAt(position)) {
          newArray.add(mean);
        }
      }
      var rand = Random();
      int next = rand.nextInt(means.length);

      return newArray.elementAt(next);
    }
  }
}
