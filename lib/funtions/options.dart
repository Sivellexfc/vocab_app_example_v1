import 'dart:math';

class OptionsAction {
  static String getRandomWordTR(
      Set words, Set means, int number, int position) {
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
      int next = rand.nextInt(means.length - 1);

      return newArray.elementAt(next);
    }
  }

  static String getRandomWordTR_init(
      Set words, Set means, int number, int position) {
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
