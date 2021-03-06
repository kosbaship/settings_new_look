import 'package:flutter/material.dart';
import 'package:settings_new_look/utilities/app_configurations.dart';
import 'package:settings_new_look/utilities/app_theme.dart';
import 'package:settings_new_look/views/settings_module/schedule_views/doctor_schedule_layout.dart';

void main() {
  setupAppConfigurations();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: kAppTheme(),
        home: ScheduleScreen(),
      );
}
