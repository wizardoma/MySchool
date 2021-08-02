import 'package:flutter/material.dart';

const kAuthorNameStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

const kPostTitleTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);

const kSubtitleTextStyle = TextStyle(fontSize: 12, color: Colors.grey);

ThemeData customTheme(bool isDark) {
  var theme = isDark ? ThemeData.dark() : ThemeData.light();
  return getTheme(theme);
}

ThemeData getTheme(ThemeData themeData) {
  return themeData.copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: themeData.textTheme
        .copyWith(
          bodyText2: themeData.textTheme.bodyText2.copyWith(
            color: Colors.black87,
            fontSize: 15,
          ),
          bodyText1: themeData.textTheme.bodyText1.copyWith(
            color: Colors.black87,
            fontSize: 15,
          ),
          headline6: themeData.textTheme.headline6.copyWith(
            color: Colors.black87,
            fontSize: 15,
          ),
        )
        .apply(
          bodyColor: Colors.black87,
          displayColor: Colors.black87,
        ),
  );
}
