import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:settings_new_look/utilities/app_colors.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_cubit.dart';

class ExaminationAndConfirmScheduleSection extends StatelessWidget {
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
              CustomDropDownButton(
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
              CustomDropDownButton(
                value: SettingsCubit.get(context).confirmationScheduleValue,
                onChanged: (String newValue) => SettingsCubit.get(context)
                    .changeConfirmationScheduleValue(newValue),
                items: <String>[
                  kConfirmationScheduleDropdownInitialValue,
                  kConfirmationScheduleDropdownSecondValue,
                  kConfirmationScheduleDropdownThirdValue,
                  kConfirmationScheduleDropdownForthValue,
                ]
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          SizedBox(
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
                      'Fees',
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
                    controller:
                        SettingsCubit.get(context).examinationPriceController,
                    hintText: 'Examination price (EGP)',
                    validator: (String value) => value.isEmpty
                        ? 'please write your examination price'
                        : null,
                  ),
                ),
              ],
            ),
          )
        ],
      );
}
