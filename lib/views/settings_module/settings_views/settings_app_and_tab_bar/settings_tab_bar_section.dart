import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_cubit.dart';

class SettingsCustomTabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TabBar(
          onTap: (index) => SettingsCubit.get(context).changeTabBarIndex(index),
          tabs: [
            SettingsCubit.get(context).tabBarIndex == 0
                ? buildActiveClinicTab(context)
                : buildUnActiveClinicTab(context),
            SettingsCubit.get(context).tabBarIndex == 1
                ? buildActiveCallTab(context)
                : buildUnActiveCallTab(context),
          ],
        ),
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
}