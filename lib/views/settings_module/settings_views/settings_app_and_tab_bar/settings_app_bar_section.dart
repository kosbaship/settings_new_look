import 'package:flutter/material.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_cubit.dart';

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
            // await ApiHelper.getInstance.getDoctorSettingsData();
            SettingsCubit.get(context).getDoctorSettingsData();
            //  SettingsCubit.get(context).saveAllTheSettings();
          },
          child: OneLineText(
            kSave.toUpperCase(),
            style: Theme.of(context).textTheme.button,
          ),
        )
      ],
    );
