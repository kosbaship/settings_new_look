import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_new_look/views/settings_page/settings_sections.dart';

import 'settings_sections.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int tabBarIndex = 0;

  @override
  Widget build(BuildContext context) => DefaultTabController(
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
                    onTap: (int index) {
                      setState(() => this.tabBarIndex = index);
                    },
                    tabs: [
                      this.tabBarIndex == 0
                          ? buildActiveClinicTab(context)
                          : buildUnActiveClinicTab(context),
                      this.tabBarIndex == 1
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
      );
}
