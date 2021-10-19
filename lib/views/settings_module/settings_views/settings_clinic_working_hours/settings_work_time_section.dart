import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:settings_new_look/utilities/app_colors.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_enums.dart';
import 'package:settings_new_look/utilities/app_helper_methods.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_cubit.dart';

class WorkTimeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(kFeesSVG),
              SizedBox(
                width: 16.0,
              ),
              OneLineText(
                kWorkTime,
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
            itemBuilder: (context, index) => WorkTimeListItem(
              dayListItemIndex: index,
            ),
            itemCount: kDaysOfTheWeek.length,
          )
        ],
      );
}

class WorkTimeListItem extends StatelessWidget {
  final int dayListItemIndex;

  const WorkTimeListItem({@required this.dayListItemIndex});

  @override
  Widget build(BuildContext context) => Column(
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
                          .scheduleDoctorFixed
                          .result
                          .clinic
                          .workingDays[this.dayListItemIndex]
                          .wdayActiveDay) ==
                      1
                  ? true
                  : false,
              title: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: int.tryParse(SettingsCubit.get(context)
                                        .scheduleDoctorFixed
                                        .result
                                        .clinic
                                        .workingDays[this.dayListItemIndex]
                                        .wdayActiveDay) ==
                                    1
                                ? kAppDefaultColor
                                : kAppWhiteColor,
                            width: 2.0),
                      ),
                    ),
                    child: Text(
                      kDaysOfTheWeek[this.dayListItemIndex],
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                ],
              ),
              trailing: int.tryParse(SettingsCubit.get(context)
                          .scheduleDoctorFixed
                          .result
                          .clinic
                          .workingDays[this.dayListItemIndex]
                          .wdayActiveDay) ==
                      1
                  ? SvgPicture.asset(kActiveCupertinoSwitchSVG)
                  : SvgPicture.asset(kUnActiveCupertinoSwitchSVG),
              children: <Widget>[
                buildWorkTimeDayListItemBody(context, this.dayListItemIndex)
              ],
              onExpansionChanged: (bool expanded) => SettingsCubit.get(context)
                  .activateDay(expanded, this.dayListItemIndex),
            ),
          ),
        ],
      );

  Widget buildWorkTimeDayListItemBody(context, dayListItemIndex) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              height: kOneShiftItemHeight,
              child: Column(
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
                                          style:
                                              TextStyle(color: kAppWhiteColor),
                                        ),
                                        color: kToastError,
                                      ),
                                      DialogButton(
                                        onPressed: () {
                                          SettingsCubit.get(context)
                                              .confirmSelectedDate(
                                                  dayListItemIndex,
                                                  ShiftType.FirstShiftStart);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Confirm',
                                          style:
                                              TextStyle(color: kAppWhiteColor),
                                        ),
                                        color: kToastSuccess,
                                      ),
                                    ],
                                    contentWidget: showDatePickerWidget(
                                      context,
                                      250,
                                      (dateTime) {
                                        SettingsCubit.get(context)
                                            .selectDate(dateTime);
                                      },
                                      CupertinoDatePickerMode.time,
                                    ));
                              },
                              child: Row(
                                children: [
                                  OneLineText(
                                    SettingsCubit.get(context)
                                        .scheduleDoctorFixed
                                        .result
                                        .clinic
                                        .workingDays[dayListItemIndex]
                                        .wdayFrom,
                                    style:
                                        Theme.of(context).textTheme.headline5,
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
                                          style:
                                              TextStyle(color: kAppWhiteColor),
                                        ),
                                        color: kToastError,
                                      ),
                                      DialogButton(
                                        onPressed: () {
                                          SettingsCubit.get(context)
                                              .confirmSelectedDate(
                                                  dayListItemIndex,
                                                  ShiftType.FirstShiftEnd);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Confirm',
                                          style:
                                              TextStyle(color: kAppWhiteColor),
                                        ),
                                        color: kToastSuccess,
                                      ),
                                    ],
                                    contentWidget: showDatePickerWidget(
                                      context,
                                      250,
                                      (dateTime) {
                                        SettingsCubit.get(context)
                                            .selectDate(dateTime);
                                      },
                                      CupertinoDatePickerMode.time,
                                    ));
                              },
                              child: Row(
                                children: [
                                  OneLineText(
                                    SettingsCubit.get(context)
                                        .scheduleDoctorFixed
                                        .result
                                        .clinic
                                        .workingDays[dayListItemIndex]
                                        .wdayTo,
                                    style:
                                        Theme.of(context).textTheme.headline5,
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
                        .scheduleDoctorFixed
                        .result
                        .clinic
                        .workingDays[dayListItemIndex]
                        .wdayDuration,
                    onChanged: (String newValue) => SettingsCubit.get(context)
                        .changeFirstShiftExaminationDurationDropdownValue(
                            newValue, dayListItemIndex),
                    items: examinationDurationDropdownItems
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value + ' minutes'),
                                ))
                        .toList(),
                  ),
                  TextButton(
                      onPressed: () => SettingsCubit.get(context)
                          .enableSecondShift(dayListItemIndex),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          SizedBox(width: 8.0),
                          Text(
                            kAddShift,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: kAppDefaultColor),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SettingsCubit.get(context)
                        .scheduleDoctorFixed
                        .result
                        .clinic
                        .workingDays[dayListItemIndex]
                        .wdayActiveShift ==
                    1.toString()
                ? Container(
                    height: kOneShiftItemHeight,
                    child: Column(
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
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      {
                                        onAlertWithCustomContentPressed(context,
                                            title: 'Choose Time',
                                            buttons: [
                                              DialogButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: kAppWhiteColor),
                                                ),
                                                color: kToastError,
                                              ),
                                              DialogButton(
                                                onPressed: () {
                                                  SettingsCubit.get(context)
                                                      .confirmSelectedDate(
                                                          dayListItemIndex,
                                                          ShiftType
                                                              .SecondShiftStart);
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Confirm',
                                                  style: TextStyle(
                                                      color: kAppWhiteColor),
                                                ),
                                                color: kToastSuccess,
                                              ),
                                            ],
                                            contentWidget: showDatePickerWidget(
                                              context,
                                              250,
                                              (dateTime) {
                                                SettingsCubit.get(context)
                                                    .selectDate(dateTime);
                                              },
                                              CupertinoDatePickerMode.time,
                                            ));
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        OneLineText(
                                          SettingsCubit.get(context)
                                              .scheduleDoctorFixed
                                              .result
                                              .clinic
                                              .workingDays[dayListItemIndex]
                                              .wdayFrom2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
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
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      {
                                        onAlertWithCustomContentPressed(context,
                                            title: 'Choose Time',
                                            buttons: [
                                              DialogButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: kAppWhiteColor),
                                                ),
                                                color: kToastError,
                                              ),
                                              DialogButton(
                                                onPressed: () {
                                                  SettingsCubit.get(context)
                                                      .confirmSelectedDate(
                                                          dayListItemIndex,
                                                          ShiftType
                                                              .SecondShiftEnd);
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Confirm',
                                                  style: TextStyle(
                                                      color: kAppWhiteColor),
                                                ),
                                                color: kToastSuccess,
                                              ),
                                            ],
                                            contentWidget: showDatePickerWidget(
                                              context,
                                              250,
                                              (dateTime) {
                                                SettingsCubit.get(context)
                                                    .selectDate(dateTime);
                                              },
                                              CupertinoDatePickerMode.time,
                                            ));
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        OneLineText(
                                          SettingsCubit.get(context)
                                              .scheduleDoctorFixed
                                              .result
                                              .clinic
                                              .workingDays[dayListItemIndex]
                                              .wdayTo2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
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
                              .scheduleDoctorFixed
                              .result
                              .clinic
                              .workingDays[dayListItemIndex]
                              .wdayDuration2,
                          onChanged: (String newValue) => SettingsCubit.get(
                                  context)
                              .changeSecondShiftExaminationDurationDropdownValue(
                                  newValue, dayListItemIndex),
                          items: examinationDurationDropdownItems
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value + ' minutes'),
                                      ))
                              .toList(),
                        ),
                        TextButton(
                            onPressed: () => SettingsCubit.get(context)
                                .disableSecondShift(dayListItemIndex),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: kToastError,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  kRemoveShift,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(color: kToastError),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      );
}
