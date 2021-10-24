import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:settings_new_look/utilities/app_colors.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/views/settings_module/schedule_cubit/settings_cubit.dart';
import 'package:settings_new_look/views/settings_module/schedule_cubit/settings_states.dart';
import 'package:settings_new_look/views/settings_module/schedule_views/schedule_call_timings/call_tab_view.dart';
import 'package:settings_new_look/views/settings_module/schedule_views/schedule_clinic_timings/clinic_tab_view.dart';
import 'package:settings_new_look/views/settings_module/schedule_views/schedule_clinic_timings/clinic_tab_view_widgets.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SettingsCubit()..getScheduleDoctor(),
        child: BlocConsumer<SettingsCubit, SettingsStates>(
          listener: (context, state) {},
          builder: (context, state) => DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: kAppBackgroundColor,
              appBar: buildAppBarView(context),
              body: Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    state is! SettingsLoadingDataInProgressState,
                widgetBuilder: (context) => Conditional.single(
                  context: context,
                  conditionBuilder: (BuildContext context) =>
                      state is! SettingsErrorLoadingDataState,
                  widgetBuilder: (BuildContext context) =>
                      _buildSettingScreenLayout(context),
                  fallbackBuilder: (BuildContext context) => _buildErrorLayout(
                      (state as SettingsErrorLoadingDataState).errorMessage),
                ),
                fallbackBuilder: (context) => _buildLoadingLayout(),
              ),
            ),
          ),
        ),
      );

  Widget _buildSettingScreenLayout(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            ClinicTabBar(),
            Expanded(
              child: Form(
                key: SettingsCubit.get(context).formKey,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ClinicTimings(),
                    CallTimings(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildLoadingLayout() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OneLineText('Please wait ...'),
            SizedBox(
              height: 12.0,
            ),
            CupertinoActivityIndicator()
          ],
        ),
      );

  Widget _buildErrorLayout(errorMessage) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OneLineText(errorMessage),
            SizedBox(
              height: 12.0,
            ),
            Icon(
              Icons.close,
              size: 58,
              color: kToastError,
            )
          ],
        ),
      );
}
