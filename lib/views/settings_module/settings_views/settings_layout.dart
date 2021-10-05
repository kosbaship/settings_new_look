import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_cubit.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_states.dart';
import 'package:settings_new_look/views/settings_module/settings_views/settings_app_and_tab_bar.dart';
import 'package:settings_new_look/views/settings_module/settings_views/settings_clinic_working_hours.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SettingsCubit(),
        child: BlocConsumer<SettingsCubit, SettingsStates>(
          listener: (context, state) {},
          builder: (context, state) => DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: buildAppBarSection(context),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    CustomTabBarSection(),
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
              ),
            ),
          ),
        ),
      );
}
