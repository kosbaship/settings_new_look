import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_strings.dart';

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
                itemBuilder: (context, index) => ListTile(
                  leading: Text(
                    kDaysOfTheWeek[index],
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontSize: 16.0),
                  ),
                  trailing: CupertinoSwitch(
                    value: true,
                    onChanged: (bool value) {},
                  ),
                ),
                itemCount: kDaysOfTheWeek.length,
              ),
            )
          ],
        ),
      );
}
