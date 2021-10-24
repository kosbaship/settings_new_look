import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:settings_new_look/utilities/app_colors.dart';
import 'package:settings_new_look/utilities/app_components.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/schedule_cubit/settings_cubit.dart';

class CallTabVoiceFees extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: kAppBorderColor)),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(kFeesSVG),
                    SizedBox(
                      width: 16.0,
                    ),
                    OneLineText(
                      kFees,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontSize: 16),
                    )
                  ],
                ),
                Container(
                  width: 200,
                  child: CustomTextFormField(
                    controller: SettingsCubit.get(context).callPriceController,
                    hintText: 'Examination price (EGP)',
                    validator: (String value) => value.isEmpty
                        ? 'please write your examination price'
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      );
}
