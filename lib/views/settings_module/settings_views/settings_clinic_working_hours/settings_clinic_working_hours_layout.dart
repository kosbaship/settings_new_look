import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_cubit.dart';
import 'package:settings_new_look/views/settings_module/settings_views/settings_clinic_working_hours/settings_work_time_section.dart';

import 'settings_examination_and_schedule_section.dart';

class ClinicWorkingHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Form(
        key: SettingsCubit.get(context).formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.red,

              /// TODO: Logic to make the whole list scrollable

              height: 4500,
              child: Column(
                children: [
                  ExaminationAndConfirmScheduleSection(),
                  WorkTimeSection()
                ],
              ),
            ),
          ),
        ),
      );
}
