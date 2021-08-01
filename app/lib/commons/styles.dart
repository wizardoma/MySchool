import 'package:flutter/material.dart';

const kAuthorNameStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

const kPostTitleTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);

const kSubtitleTextStyle = TextStyle(fontSize: 12, color: Colors.grey);

ThemeData customTheme(bool isDark) {
  return isDark
      ? ThemeData.dark()
      : ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
            bodyText1: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
        );
}
