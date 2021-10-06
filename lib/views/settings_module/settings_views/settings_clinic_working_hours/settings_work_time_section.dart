import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:settings_new_look/utilities/app_colors.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_cubit.dart';

class WorkTimeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(kFeesSVG),
                SizedBox(
                  width: 16.0,
                ),
                OneLineText(
                  kWorkTime,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: 16),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => WorkTimeListItem(
                  index: index,
                ),
                itemCount: kDaysOfTheWeek.length,
              ),
            )
          ],
        ),
      );
}

class WorkTimeListItem extends StatelessWidget {
  final int index;

  const WorkTimeListItem({@required this.index});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 8.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: kAppWhiteColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ExpansionTile(
              title: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: SettingsCubit.get(context)
                                    .expandedTilesValue[this.index]
                                ? kAppDefaultColor
                                : kAppWhiteColor,
                            width: 2.0),
                      ),
                    ),
                    child: Text(
                      kDaysOfTheWeek[this.index],
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                ],
              ),
              trailing:
                  SettingsCubit.get(context).expandedTilesValue[this.index]
                      ? SvgPicture.asset(kActiveCupertinoSwitchSVG)
                      : SvgPicture.asset(kUnActiveCupertinoSwitchSVG),
              children: const <Widget>[
                ListTile(title: Text('This is tile number 2')),
              ],
              onExpansionChanged: (bool expanded) => SettingsCubit.get(context)
                  .changeExpandedTilesValue(expanded, this.index),
            ),
          ),
        ],
      );
}
