import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_new_look/utilities/app_colors.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_cubit.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_states.dart';
import 'package:settings_new_look/views/settings_module/settings_views/settings_app_and_tab_bar/settings_app_bar_section.dart';
import 'package:settings_new_look/views/settings_module/settings_views/settings_app_and_tab_bar/settings_tab_bar_section.dart';
import 'package:settings_new_look/views/settings_module/settings_views/settings_clinic_working_hours/settings_clinic_working_hours_layout.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SettingsCubit()..getDoctorSettingsData(),
        child: BlocConsumer<SettingsCubit, SettingsStates>(
          listener: (context, state) {},
          builder: (context, state) => DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: kAppBackgroundColor,
              appBar: buildAppBarSection(context),
              body: state is! SettingsLoadingDataInProgressState
                  ? _buildSettingScreenLayout(context)
                  : _buildLoadingLayout(),
            ),
          ),
        ),
      );

  Widget _buildSettingScreenLayout(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            SettingsCustomTabBarSection(),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ClinicWorkingHours(),
                  Icon(
                    Icons.directions_bike,
                    color: Colors.red,
                    size: 45,
                  ),
                ],
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
}
