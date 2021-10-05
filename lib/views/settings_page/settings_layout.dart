import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:settings_new_look/shared/app_colors.dart';
import 'package:settings_new_look/shared/app_compponents.dart';
import 'package:settings_new_look/shared/app_strings.dart';
import 'package:settings_new_look/views/settings_page/settings_sections.dart';

import 'settings_sections.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TabBar(
                    tabs: [
                      Tab(
                        icon: Row(
                          children: [
                            Spacer(),
                            SvgPicture.asset(kBlueClinicMedicalSVG),
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
                      ),
                      Tab(
                        icon: Row(
                          children: [
                            Spacer(),
                            SvgPicture.asset(kGreyPhoneSVG),
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
                      ),
                    ],
                  ),
                ),
                Container(
                  color: kToastSuccess,
                ),
              ],
            ),
          ),
        ),
      );
}
