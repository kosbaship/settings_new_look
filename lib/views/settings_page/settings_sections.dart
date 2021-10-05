import 'package:flutter/material.dart';
import 'package:settings_new_look/shared/app_strings.dart';

AppBar buildAppBar(BuildContext context) => AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        kSettingsScreenTitle,
        style: Theme.of(context).textTheme.headline1,
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            kSave,
            style: Theme.of(context).textTheme.button,
          ),
        )
      ],
    );
