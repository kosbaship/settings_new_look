import 'package:flutter/material.dart';
import 'package:settings_new_look/data/remote/api_helper.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_strings.dart';

AppBar buildAppBarSection(BuildContext context) => AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      title: OneLineText(
        kSettingsScreenTitle,
        style: Theme.of(context).textTheme.headline1,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await ApiHelper.getInstance.getDoctorSettingsData();
            // return SettingsCubit.get(context).saveAllTheSettings();
          },
          child: OneLineText(
            kSave.toUpperCase(),
            style: Theme.of(context).textTheme.button,
          ),
        )
      ],
    );
