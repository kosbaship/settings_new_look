import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_new_look/views/settings_page/settings_cubit/settings_cubit.dart';
import 'package:settings_new_look/views/settings_page/settings_cubit/settings_states.dart';
import 'package:settings_new_look/views/settings_page/settings_sections.dart';

import 'settings_sections.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SettingsCubit(),
        child: BlocConsumer<SettingsCubit, SettingsStates>(
          listener: (context, state) {},
          builder: (context, state) => DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: buildAppBar(context),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TabBar(
                        onTap: (index) =>
                            SettingsCubit.get(context).changeIndex(index),
                        tabs: [
                          SettingsCubit.get(context).tabBarIndex == 0
                              ? buildActiveClinicTab(context)
                              : buildUnActiveClinicTab(context),
                          SettingsCubit.get(context).tabBarIndex == 1
                              ? buildActiveCallTab(context)
                              : buildUnActiveCallTab(context),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Icon(
                            Icons.directions_car,
                            color: Colors.red,
                            size: 45,
                          ),
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
