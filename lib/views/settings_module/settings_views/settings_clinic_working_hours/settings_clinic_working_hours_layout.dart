import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_cubit.dart';

import 'examination_and_schedule_section.dart';

class ClinicWorkingHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Form(
        key: SettingsCubit.get(context).formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Container(
            child: Column(
              children: [
                ExaminationAndConfirmScheduleSection(),
              ],
            ),
          ),
        ),
      );
}
