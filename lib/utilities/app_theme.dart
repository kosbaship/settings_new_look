import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_strings.dart';

ThemeData kAppTheme() => ThemeData(
      appBarTheme: AppBarTheme(
        color: kAppDefaultColor,
      ),
      textTheme: TextTheme(
        button: TextStyle(
          fontSize: 16,
          color: kAppWhiteColor,
          fontFamily: KCairoRegularFont,
        ),
        headline1: TextStyle(
          fontSize: 20,
          color: kAppWhiteColor,
          fontFamily: KCairoRegularFont,
        ),
        headline2: TextStyle(
          fontSize: 16,
          color: kAppActiveColor,
          fontFamily: KSimiBoldFont,
        ),
        headline3: TextStyle(
          fontSize: 16,
          color: kAppUnActiveColor,
          fontFamily: KSimiBoldFont,
        ),
        headline4: TextStyle(
          fontSize: 14,
          color: kAppUnActiveColor,
          fontFamily: KPoppinsMediumFont,
        ),
      ),
    );
