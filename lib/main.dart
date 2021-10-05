import 'package:flutter/material.dart';
import 'package:settings_new_look/shared/app_theme.dart';
import 'package:settings_new_look/views/settings_page/settings_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kAppTheme(),
      home: SettingsPage(),
    );
  }
}
