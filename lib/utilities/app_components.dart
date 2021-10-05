import 'package:flutter/material.dart';
import 'package:settings_new_look/utilities/app_colors.dart';

class OneLineText extends StatelessWidget {
  final String text;
  final TextStyle style;

  OneLineText(this.text, {this.style});

  @override
  Widget build(BuildContext context) => Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      );
}

class CustomDropDownButton extends StatelessWidget {
  final String value;
  final List<DropdownMenuItem<String>> items;
  final void Function(String) onChanged;

  CustomDropDownButton(
      {@required this.value, @required this.items, @required this.onChanged});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: kAppWhiteColor,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: kAppBorderColor)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: this.value,
                elevation: 12,
                style: Theme.of(context).textTheme.headline5,
                onChanged: this.onChanged,
                items: this.items,
              ),
            ),
          ),
        ),
      );
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String Function(String) validator;

  CustomTextFormField(
      {@required this.controller,
      @required this.hintText,
      @required this.validator});

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: this.controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: this.hintText,
          hintStyle: Theme.of(context).textTheme.headline5,
        ),
        validator: this.validator,
      );
}
