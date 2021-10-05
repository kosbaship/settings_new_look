import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_strings.dart';

ThemeData kAppTheme() => ThemeData(
      appBarTheme: AppBarTheme(
        color: kDefaultColor,
      ),
      textTheme: TextTheme(
        button: TextStyle(
          fontSize: 16,
          color: kWhiteColor,
          fontFamily: KCairoRegularFont,
        ),
        headline1: TextStyle(
          fontSize: 20,
          color: kWhiteColor,
          fontFamily: KCairoRegularFont,
        ),
      ),
    );
