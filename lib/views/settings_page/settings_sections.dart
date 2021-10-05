import 'package:flutter/material.dart';
import 'package:settings_new_look/shared/app_compponents.dart';
import 'package:settings_new_look/shared/app_enums.dart';
import 'package:settings_new_look/shared/app_helper_methods.dart';
import 'package:settings_new_look/shared/app_strings.dart';

AppBar buildAppBar(BuildContext context) => AppBar(
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
          onPressed: () => showToast(
            color: ToastColors.WARNING,
            massage: kToastWarning,
          ),
          child: OneLineText(
            kSave.toUpperCase(),
            style: Theme.of(context).textTheme.button,
          ),
        )
      ],
    );
