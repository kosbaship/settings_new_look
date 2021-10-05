import 'package:flutter/material.dart';
import 'package:settings_new_look/shared/app_colors.dart';
import 'package:settings_new_look/views/settings_page/settings_sections.dart';

import 'settings_sections.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            color: kGreenColor,
          ),
        ),
      );
}
