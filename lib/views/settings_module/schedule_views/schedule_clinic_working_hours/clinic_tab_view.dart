import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_new_look/views/settings_module/schedule_cubit/settings_cubit.dart';
import 'package:settings_new_look/views/settings_module/schedule_views/schedule_clinic_working_hours/schedule_widgets.dart';

class ClinicWorkingHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Form(
        key: SettingsCubit.get(context).formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ClinicTabView(),
                FeesSection(),
                WorkTimeSection(),
              ],
            ),
          ),
        ),
      );
}