import 'package:shared_preferences/shared_preferences.dart';

setIncrement(String chapter) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(chapter, 1);
}

getIncrement() async {
  //SharedPreferences prefs = await SharedPreferences.getInstance();
}
