import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_cubit.dart';

class ClinicWorkingHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
