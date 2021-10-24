import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/schedule_cubit/settings_cubit.dart';
import 'package:settings_new_look/views/settings_module/schedule_views/schedule_clinic_timings/clinic_tab_view_widgets.dart';

class ClinicTimings extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ClinicTabSelection(),
              Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    SettingsCubit.get(context).examinationDropdownValue ==
                    kExaminationDropdownInitialValue,
                widgetBuilder: (context) => _drawFixedDatesView(context),
                fallbackBuilder: (context) => _drawFirstInFirstOutView(context),
              ),
            ],
          ),
        ),
      );

  Widget _drawFixedDatesView(BuildContext context) => Column(
        children: [ClinicTabFixedDatesFees(), ClinicTabFixedDatesWorkTime()],
      );

  Widget _drawFirstInFirstOutView(BuildContext context) => Column(
        children: [
          ClinicTabFirstInFirstOutFees(),
          ClinicTabFirstInFirstOutWorkTime()
        ],
      );
}
