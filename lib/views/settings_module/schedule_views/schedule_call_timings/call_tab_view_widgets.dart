import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:settings_new_look/utilities/app_colors.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/schedule_cubit/settings_cubit.dart';

class CallTabVoiceFees extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: kAppBorderColor)),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(kFeesSVG),
                    SizedBox(
                      width: 16.0,
                    ),
                    OneLineText(
                      kFees,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 16),
                    )
                  ],
                ),
                Container(
                  width: 200,
                  child: CustomTextFormField(
                    controller: SettingsCubit.get(context).callPriceController,
                    hintText: 'Voice call price (EGP)',
                    validator: (String value) => value.isEmpty
                        ? 'please write your Voice call price'
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      );
}

class CallTabVideoFees extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 8.0,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: kAppBorderColor)),
            child: ExpansionTile(
              initiallyExpanded: int.tryParse(SettingsCubit.get(context)
                              .doctorSchedule
                              .result
                              .fixedDate
                              .fdCall
                              .fdActiveVideo) ==
                          1 &&
                      int.tryParse(SettingsCubit.get(context)
                              .doctorSchedule
                              .result
                              .fixedDate
                              .fdCall
                              .fdActiveVideo) !=
                          null
                  ? true
                  : false,
              title: Row(
                children: [
                  Text(
                    kAllowVideoCalls,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                ],
              ),
              trailing: int.tryParse(SettingsCubit.get(context)
                          .doctorSchedule
                          .result
                          .fixedDate
                          .fdCall
                          .fdActiveVideo) ==
                      1
                  ? SvgPicture.asset(kActiveCupertinoSwitchSVG)
                  : SvgPicture.asset(kUnActiveCupertinoSwitchSVG),
              children: <Widget>[_buildCallVideoPriceBody(context)],
              onExpansionChanged: (bool expanded) =>
                  SettingsCubit.get(context).activateVideoCall(expanded),
            ),
          ),
        ],
      );

  Widget _buildCallVideoPriceBody(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: SettingsCubit.get(context).videoPriceController,
                    hintText: 'Video call price (EGP)',
                    validator: (String value) => value.isEmpty
                        ? 'please write your Video call price'
                        : null,
                  ),
                  const SizedBox(
                    height: 8.0,
                  )
                ],
              ),
            ),
          ],
        ),
      );
}

class CallTabSpotFees extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 8.0,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: kAppBorderColor)),
            child: ExpansionTile(
              initiallyExpanded: int.tryParse(SettingsCubit.get(context)
                              .doctorSchedule
                              .result
                              .fixedDate
                              .fdCall
                              .fdActiveSpot) ==
                          1 &&
                      int.tryParse(SettingsCubit.get(context)
                              .doctorSchedule
                              .result
                              .fixedDate
                              .fdCall
                              .fdActiveSpot) !=
                          null
                  ? true
                  : false,
              title: Row(
                children: [
                  Text(
                    kAllowVideoCalls,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                ],
              ),
              trailing: int.tryParse(SettingsCubit.get(context)
                          .doctorSchedule
                          .result
                          .fixedDate
                          .fdCall
                          .fdActiveSpot) ==
                      1
                  ? SvgPicture.asset(kActiveCupertinoSwitchSVG)
                  : SvgPicture.asset(kUnActiveCupertinoSwitchSVG),
              children: <Widget>[_buildCallSpotPriceBody(context)],
              onExpansionChanged: (bool expanded) =>
                  SettingsCubit.get(context).activateSpotCall(expanded),
            ),
          ),
        ],
      );

  Widget _buildCallSpotPriceBody(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: SettingsCubit.get(context).spotPriceController,
                    hintText: 'Spot call price (EGP)',
                    validator: (String value) => value.isEmpty
                        ? 'please write your Spot call price'
                        : null,
                  ),
                  const SizedBox(
                    height: 8.0,
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
