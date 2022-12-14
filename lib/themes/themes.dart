// 请按文件名排序放置
import 'package:flutter/material.dart';

//export 'dark_theme.dart';
//export 'light_theme.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      dataTableTheme: DataTableThemeData(
        dataTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        headingTextStyle: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        dataRowColor: MaterialStateProperty.all<Color>(
          Color.fromARGB(255, 97, 4, 38),
        ),
        dataRowHeight: 24,
        headingRowHeight: 24,
        headingRowColor: MaterialStateProperty.all<Color>(
          Color.fromARGB(255, 107, 67, 199),
        ),
      ),
      highlightColor: Color.fromARGB(26, 59, 2, 2),
      canvasColor: Color.fromARGB(255, 212, 215, 218),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      backgroundColor: Color.fromARGB(255, 33, 37, 41),
      primaryTextTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        headline1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      buttonTheme: ButtonThemeData(
        minWidth: 90,
        height: 27,
        buttonColor: Color.fromARGB(255, 39, 50, 123),
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
        fontSize: 5,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )),
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 39, 50, 123),
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
