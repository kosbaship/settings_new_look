import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:settings_new_look/utilities/app_colors.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_enums.dart';
import 'package:settings_new_look/utilities/app_helper_methods.dart';
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

class CallTabCallsTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              SvgPicture.asset(kCalenderSVG),
              SizedBox(
                width: 16.0,
              ),
              OneLineText(
                kCallsTime,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontSize: 16),
              )
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, dayListItemIndex) => Column(
              children: [
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kAppWhiteColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ExpansionTile(
                    initiallyExpanded: int.tryParse(SettingsCubit.get(context)
                                    .doctorSchedule
                                    .result
                                    .fixedDate
                                    .fdCall
                                    .fdWorkingDays[dayListItemIndex]
                                    .fdWdayActiveDay) ==
                                1 &&
                            int.tryParse(SettingsCubit.get(context)
                                    .doctorSchedule
                                    .result
                                    .fixedDate
                                    .fdCall
                                    .fdWorkingDays[dayListItemIndex]
                                    .fdWdayActiveDay) !=
                                null
                        ? true
                        : false,
                    title: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: int.tryParse(SettingsCubit.get(context)
                                              .doctorSchedule
                                              .result
                                              .fixedDate
                                              .fdCall
                                              .fdWorkingDays[dayListItemIndex]
                                              .fdWdayActiveDay) ==
                                          1
                                      ? kAppDefaultColor
                                      : kAppWhiteColor,
                                  width: 2.0),
                            ),
                          ),
                          child: Text(
                            kDaysOfTheWeek[dayListItemIndex],
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      fontSize: 16.0,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    trailing: int.tryParse(SettingsCubit.get(context)
                                .doctorSchedule
                                .result
                                .fixedDate
                                .fdCall
                                .fdWorkingDays[dayListItemIndex]
                                .fdWdayActiveDay) ==
                            1
                        ? SvgPicture.asset(kActiveCupertinoSwitchSVG)
                        : SvgPicture.asset(kUnActiveCupertinoSwitchSVG),
                    children: <Widget>[
                      _buildCallSTimeDayListItemBody(context, dayListItemIndex)
                    ],
                    onExpansionChanged: (bool expanded) =>
                        SettingsCubit.get(context)
                            .callsTimeActivateDay(expanded, dayListItemIndex),
                  ),
                ),
              ],
            ),
            itemCount: kDaysOfTheWeek.length,
          ),
        ],
      );

  Widget _buildCallSTimeDayListItemBody(context, dayListItemIndex) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 28.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          OneLineText(
                            kExaminationFrom,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              onAlertWithCustomContentPressed(context,
                                  title: 'Choose Time',
                                  buttons: [
                                    DialogButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(color: kAppWhiteColor),
                                      ),
                                      color: kToastError,
                                    ),
                                    DialogButton(
                                      onPressed: () {
                                        SettingsCubit.get(context)
                                            .callsTimeConfirmSelectedDate(
                                                dayListItemIndex,
                                                ShiftType.FirstShiftStart);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Confirm',
                                        style: TextStyle(color: kAppWhiteColor),
                                      ),
                                      color: kToastSuccess,
                                    ),
                                  ],
                                  contentWidget: showDatePickerWidget(
                                    context,
                                    250,
                                    (dateTime) {
                                      SettingsCubit.get(context)
                                          .callsTimeSelectDate(dateTime);
                                    },
                                    CupertinoDatePickerMode.time,
                                  ));
                            },
                            child: Row(
                              children: [
                                OneLineText(
                                  SettingsCubit.get(context)
                                      .doctorSchedule
                                      .result
                                      .fixedDate
                                      .fdCall
                                      .fdWorkingDays[dayListItemIndex]
                                      .fdWdayFrom,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                SvgPicture.asset(kBlackDownArrowSVG),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 44.0,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          OneLineText(
                            kExaminationTo,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              onAlertWithCustomContentPressed(context,
                                  title: 'Choose Time',
                                  buttons: [
                                    DialogButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(color: kAppWhiteColor),
                                      ),
                                      color: kToastError,
                                    ),
                                    DialogButton(
                                      onPressed: () {
                                        SettingsCubit.get(context)
                                            .callsTimeConfirmSelectedDate(
                                                dayListItemIndex,
                                                ShiftType.FirstShiftEnd);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Confirm',
                                        style: TextStyle(color: kAppWhiteColor),
                                      ),
                                      color: kToastSuccess,
                                    ),
                                  ],
                                  contentWidget: showDatePickerWidget(
                                    context,
                                    250,
                                    (dateTime) {
                                      SettingsCubit.get(context)
                                          .callsTimeSelectDate(dateTime);
                                    },
                                    CupertinoDatePickerMode.time,
                                  ));
                            },
                            child: Row(
                              children: [
                                OneLineText(
                                  SettingsCubit.get(context)
                                      .doctorSchedule
                                      .result
                                      .fixedDate
                                      .fdCall
                                      .fdWorkingDays[dayListItemIndex]
                                      .fdWdayTo,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                SvgPicture.asset(kBlackDownArrowSVG),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    OneLineText(
                      kExaminationDuration,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                CustomDropDownWithUnderLine(
                  value: SettingsCubit.get(context)
                      .doctorSchedule
                      .result
                      .fixedDate
                      .fdCall
                      .fdWorkingDays[dayListItemIndex]
                      .fdWdayDuration,
                  onChanged: (String newValue) => SettingsCubit.get(context)
                      .callsTimeDatesFirstShiftExaminationDurationDropdownValue(
                          newValue, dayListItemIndex),
                  items: kExaminationDurationDropdownItems
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value + ' minutes'),
                              ))
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      );
}
