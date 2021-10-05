import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            massage: kToastWarningText,
          ),
          child: OneLineText(
            kSave.toUpperCase(),
            style: Theme.of(context).textTheme.button,
          ),
        )
      ],
    );

Widget buildActiveClinicTab(BuildContext context) => Tab(
      child: Row(
        children: [
          Spacer(),
          SvgPicture.asset(kActiveClinicMedicalSVG),
          SizedBox(
            width: 8.0,
          ),
          OneLineText(
            kClinicWorkingHours,
            style: Theme.of(context).textTheme.headline2,
          ),
          Spacer(),
        ],
      ),
    );

Widget buildActiveCallTab(BuildContext context) => Tab(
      child: Row(
        children: [
          Spacer(),
          SvgPicture.asset(kActivePhoneSVG),
          SizedBox(
            width: 8.0,
          ),
          OneLineText(
            kCallTimings,
            style: Theme.of(context).textTheme.headline2,
          ),
          Spacer(),
        ],
      ),
    );

Widget buildUnActiveClinicTab(BuildContext context) => Tab(
      child: Row(
        children: [
          Spacer(),
          SvgPicture.asset(kUnActiveClinicMedicalSVG),
          SizedBox(
            width: 8.0,
          ),
          OneLineText(
            kClinicWorkingHours,
            style: Theme.of(context).textTheme.headline3,
          ),
          Spacer(),
        ],
      ),
    );

Widget buildUnActiveCallTab(BuildContext context) => Tab(
      child: Row(
        children: [
          Spacer(),
          SvgPicture.asset(kUnActivePhoneSVG),
          SizedBox(
            width: 8.0,
          ),
          OneLineText(
            kCallTimings,
            style: Theme.of(context).textTheme.headline3,
          ),
          Spacer(),
        ],
      ),
    );
