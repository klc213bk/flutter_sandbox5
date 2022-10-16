// 请按文件名排序放置
import 'package:flutter/material.dart';

//export 'dark_theme.dart';
//export 'light_theme.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      canvasColor: Color.fromARGB(255, 212, 215, 218),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      textTheme: TextTheme(
          titleMedium: TextStyle(color: Color.fromARGB(26, 21, 34, 219))),
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 60, 207, 11),
      ));

  static ThemeData darkTheme = ThemeData(
      // backgroundColor: Color.fromARGB(255, 212, 215, 218),
      canvasColor: Color.fromARGB(255, 212, 215, 218),
      scaffoldBackgroundColor: Color.fromARGB(255, 212, 215, 218),
      colorScheme: ColorScheme.dark(),
      backgroundColor: Color.fromARGB(255, 29, 3, 108),
      buttonTheme:
          ButtonThemeData(buttonColor: Color.fromARGB(255, 29, 3, 108)),
      textTheme: TextTheme(
          titleMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )),
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 29, 3, 108),
      ));
}
