import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:settings_new_look/utilities/app_colors.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_enums.dart';
import 'package:settings_new_look/utilities/app_helper_methods.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/schedule_cubit/settings_cubit.dart';

AppBar buildAppBarView(BuildContext context) => AppBar(
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
            // SettingsCubit.get(context).getScheduleDoctor();
            SettingsCubit.get(context).saveAllTheSettings();
          },
          child: OneLineText(
            kSave.toUpperCase(),
            style: Theme.of(context).textTheme.button,
          ),
        )
      ],
    );

class ClinicTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBar(
        onTap: (index) => SettingsCubit.get(context).changeTabBarIndex(index),
        tabs: [
          SettingsCubit.get(context).tabBarIndex == 0
              ? buildActiveClinicTab(context)
              : buildUnActiveClinicTab(context),
          SettingsCubit.get(context).tabBarIndex == 1
              ? buildActiveCallTab(context)
              : buildUnActiveCallTab(context),
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
}

class ClinicTabSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: OneLineText(
                    kExaminationType,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: OneLineText(
                    kConfirmSchedule,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Row(
            children: [
              CustomDropDownWithoutUnderline(
                value: SettingsCubit.get(context).examinationDropdownValue,
                onChanged: (String newValue) => SettingsCubit.get(context)
                    .changeExaminationDropdownValue(newValue),
                items: <String>[
                  kExaminationDropdownInitialValue,
                  kExaminationDropdownSecondValue,
                ]
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
              ),
              SizedBox(
                width: 8.0,
              ),
              Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    SettingsCubit.get(context).examinationDropdownValue ==
                    kExaminationDropdownInitialValue,
                widgetBuilder: (context) =>
                    _buildFixedDatesConfirmationSchedule(context),
                fallbackBuilder: (context) =>
                    _buildFirstInFirstOutConfirmationSchedule(context),
              ),
            ],
          ),
        ],
      );

  Widget _buildFixedDatesConfirmationSchedule(context) =>
      CustomDropDownWithoutUnderline(
        value: SettingsCubit.get(context)
            .doctorSchedule
            .result
            .fixedDate
            .fdClinic
            .fdConfirmSchedule,
        onChanged: (String newValue) => SettingsCubit.get(context)
            .changeFixedDatesConfirmationScheduleValue(newValue),
        items: kConfirmationScheduleDropdownItems
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
      );
  Widget _buildFirstInFirstOutConfirmationSchedule(context) =>
      CustomDropDownWithoutUnderline(
        value: SettingsCubit.get(context)
            .doctorSchedule
            .result
            .firstInFirstOut
            .fnClinic
            .fnConfirmSchedule,
        onChanged: (String newValue) => SettingsCubit.get(context)
            .changeFirstInFirstOutConfirmationScheduleValue(newValue),
        items: kConfirmationScheduleDropdownItems
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
      );
}

class ClinicTabFixedDatesFees extends StatelessWidget {
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
                    controller: SettingsCubit.get(context)
                        .fixedDatesExaminationPriceController,
                    hintText: 'Examination price (EGP)',
                    validator: (String value) => value.isEmpty
                        ? 'please write your examination price'
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

class ClinicTabFixedDatesWorkTime extends StatelessWidget {
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
                                    .fdClinic
                                    .fdWorkingDays[dayListItemIndex]
                                    .fdWdayActiveDay) ==
                                1 &&
                            int.tryParse(SettingsCubit.get(context)
                                    .doctorSchedule
                                    .result
                                    .fixedDate
                                    .fdClinic
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
                                              .fdClinic
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
                                .fdClinic
                                .fdWorkingDays[dayListItemIndex]
                                .fdWdayActiveDay) ==
                            1
                        ? SvgPicture.asset(kActiveCupertinoSwitchSVG)
                        : SvgPicture.asset(kUnActiveCupertinoSwitchSVG),
                    children: <Widget>[
                      buildFixedDatesWorkTimeDayListItemBody(
                          context, dayListItemIndex)
                    ],
                    onExpansionChanged: (bool expanded) =>
                        SettingsCubit.get(context)
                            .fixedDatesActivateDay(expanded, dayListItemIndex),
                  ),
                ),
              ],
            ),
            itemCount: kDaysOfTheWeek.length,
          ),
        ],
      );

  Widget buildFixedDatesWorkTimeDayListItemBody(context, dayListItemIndex) =>
      Padding(
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
                                            .fixedDateConfirmSelectedDate(
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
                                          .selectDate(dateTime);
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
                                      .fdClinic
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
                                            .fixedDateConfirmSelectedDate(
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
                                          .selectDate(dateTime);
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
                                      .fdClinic
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
                      .fdClinic
                      .fdWorkingDays[dayListItemIndex]
                      .fdWdayDuration,
                  onChanged: (String newValue) => SettingsCubit.get(context)
                      .changeFixedDatesFirstShiftExaminationDurationDropdownValue(
                          newValue, dayListItemIndex),
                  items: kExaminationDurationDropdownItems
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value + ' minutes'),
                              ))
                      .toList(),
                ),
                TextButton(
                    onPressed: () => SettingsCubit.get(context)
                        .fixedDatesEnableSecondShift(dayListItemIndex),
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
            SettingsCubit.get(context)
                        .doctorSchedule
                        .result
                        .fixedDate
                        .fdClinic
                        .fdWorkingDays[dayListItemIndex]
                        .fdWdayActiveShift ==
                    1.toString()
                ? Column(
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
                                                    .fixedDateConfirmSelectedDate(
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
                                            .doctorSchedule
                                            .result
                                            .fixedDate
                                            .fdClinic
                                            .fdWorkingDays[dayListItemIndex]
                                            .fdWdayFrom2,
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
                                  style: Theme.of(context).textTheme.headline5,
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
                                                    .fixedDateConfirmSelectedDate(
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
                                            .doctorSchedule
                                            .result
                                            .fixedDate
                                            .fdClinic
                                            .fdWorkingDays[dayListItemIndex]
                                            .fdWdayTo2,
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
                            .doctorSchedule
                            .result
                            .fixedDate
                            .fdClinic
                            .fdWorkingDays[dayListItemIndex]
                            .fdWdayDuration2,
                        onChanged: (String newValue) => SettingsCubit.get(
                                context)
                            .changeFixedDatesSecondShiftExaminationDurationDropdownValue(
                                newValue, dayListItemIndex),
                        items: kExaminationDurationDropdownItems
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value + ' minutes'),
                                    ))
                            .toList(),
                      ),
                      TextButton(
                          onPressed: () => SettingsCubit.get(context)
                              .fixedDatesDisableSecondShift(dayListItemIndex),
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
                  )
                : Container(),
          ],
        ),
      );
}

class ClinicTabFirstInFirstOutFees extends StatelessWidget {
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
                    controller: SettingsCubit.get(context)
                        .firstInFirstOutExaminationPriceController,
                    hintText: 'Examination price (EGP)',
                    validator: (String value) => value.isEmpty
                        ? 'please write your examination price'
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

class ClinicTabFirstInFirstOutWorkTime extends StatelessWidget {
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
                                    .firstInFirstOut
                                    .fnClinic
                                    .fnWorkingDays[dayListItemIndex]
                                    .fnWdayActiveDay) ==
                                1 &&
                            int.tryParse(SettingsCubit.get(context)
                                    .doctorSchedule
                                    .result
                                    .firstInFirstOut
                                    .fnClinic
                                    .fnWorkingDays[dayListItemIndex]
                                    .fnWdayActiveDay) !=
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
                                              .firstInFirstOut
                                              .fnClinic
                                              .fnWorkingDays[dayListItemIndex]
                                              .fnWdayActiveDay) ==
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
                                .firstInFirstOut
                                .fnClinic
                                .fnWorkingDays[dayListItemIndex]
                                .fnWdayActiveDay) ==
                            1
                        ? SvgPicture.asset(kActiveCupertinoSwitchSVG)
                        : SvgPicture.asset(kUnActiveCupertinoSwitchSVG),
                    children: <Widget>[
                      buildFirstInFirstOutWorkTimeDayListItemBody(
                          context, dayListItemIndex)
                    ],
                    onExpansionChanged: (bool expanded) =>
                        SettingsCubit.get(context).firstInFirstOutActivateDay(
                            expanded, dayListItemIndex),
                  ),
                ),
              ],
            ),
            itemCount: kDaysOfTheWeek.length,
          ),
        ],
      );

  Widget buildFirstInFirstOutWorkTimeDayListItemBody(
          context, dayListItemIndex) =>
      Padding(
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
                                            .firstInFirstOutConfirmSelectedDate(
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
                                          .selectDate(dateTime);
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
                                      .firstInFirstOut
                                      .fnClinic
                                      .fnWorkingDays[dayListItemIndex]
                                      .fnWdayFrom,
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
                                            .firstInFirstOutConfirmSelectedDate(
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
                                          .selectDate(dateTime);
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
                                      .fdClinic
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
                      .firstInFirstOut
                      .fnClinic
                      .fnWorkingDays[dayListItemIndex]
                      .fnWdayDuration,
                  onChanged: (String newValue) => SettingsCubit.get(context)
                      .changeFirstInFirstOutFirstShiftExaminationDurationDropdownValue(
                          newValue, dayListItemIndex),
                  items: kExaminationDurationDropdownItems
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value + ' minutes'),
                              ))
                      .toList(),
                ),
                TextButton(
                    onPressed: () => SettingsCubit.get(context)
                        .firstInFirstOutEnableSecondShift(dayListItemIndex),
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
            SettingsCubit.get(context)
                        .doctorSchedule
                        .result
                        .firstInFirstOut
                        .fnClinic
                        .fnWorkingDays[dayListItemIndex]
                        .fnWdayActiveShift ==
                    1.toString()
                ? Column(
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
                                                    .firstInFirstOutConfirmSelectedDate(
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
                                            .doctorSchedule
                                            .result
                                            .fixedDate
                                            .fdClinic
                                            .fdWorkingDays[dayListItemIndex]
                                            .fdWdayFrom2,
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
                                  style: Theme.of(context).textTheme.headline5,
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
                                                    .firstInFirstOutConfirmSelectedDate(
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
                                            .doctorSchedule
                                            .result
                                            .firstInFirstOut
                                            .fnClinic
                                            .fnWorkingDays[dayListItemIndex]
                                            .fnWdayTo2,
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
                            .doctorSchedule
                            .result
                            .firstInFirstOut
                            .fnClinic
                            .fnWorkingDays[dayListItemIndex]
                            .fnWdayDuration2,
                        onChanged: (String newValue) => SettingsCubit.get(
                                context)
                            .changeFirstInFirstOutSecondShiftExaminationDurationDropdownValue(
                                newValue, dayListItemIndex),
                        items: kExaminationDurationDropdownItems
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value + ' minutes'),
                                    ))
                            .toList(),
                      ),
                      TextButton(
                          onPressed: () => SettingsCubit.get(context)
                              .firstInFirstOutDisableSecondShift(
                                  dayListItemIndex),
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
                  )
                : Container(),
          ],
        ),
      );
}
