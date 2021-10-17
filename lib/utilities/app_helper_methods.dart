import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'app_colors.dart';
import 'app_enums.dart';

Future<bool> showToast(
        {@required String massage,
        @required ToastColors color,
        Toast toastLength = Toast.LENGTH_SHORT,
        ToastGravity gravity = ToastGravity.BOTTOM}) =>
    Fluttertoast.showToast(
      msg: massage,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: setToastColor(color),
      textColor: Colors.white,
      fontSize: 16.0,
    );

Color setToastColor(ToastColors toastColor) {
  Color color;

  switch (toastColor) {
    case ToastColors.ERROR:
      color = kToastError;
      break;
    case ToastColors.SUCCESS:
      color = kToastSuccess;
      break;
    case ToastColors.WARNING:
      color = kToastWarning;
      break;
  }
  return color;
}

onAlertWithCustomContentPressed(context,
    {String title,
    Widget contentWidget,
    FontWeight fontWeight,
    String desc,
    Color descTextColor,
    List<DialogButton> buttons,
    AlertType alertType}) {
  return Alert(
          type: alertType ?? AlertType.none,
          style: AlertStyle(
              isCloseButton: false,
              titleStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  color: descTextColor ?? kToastSuccess),
              descStyle: TextStyle(
                  fontSize: 14, color: descTextColor ?? kToastSuccess),
              constraints: BoxConstraints(minHeight: 250, maxWidth: 300)),
          context: context,
          desc: desc,
          title: title ?? '',
          content: contentWidget ?? Container(),
          buttons: buttons ?? [])
      .show();
}

showDatePickerWidget(BuildContext context, double height,
        Function onDateTimeChanged, CupertinoDatePickerMode mode,
        {DateTime minimumDate,
        DateTime maximumDate,
        double fontSize,
        Color dateTimeTextColor,
        DateTime initDate}) =>
    Container(
      height: height ?? 350.0,
      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(
                fontSize: fontSize ?? 16.0,
                color: dateTimeTextColor ?? kAppDefaultColor),
          ),
        ),
        child: CupertinoDatePicker(
          mode: mode,
          initialDateTime: initDate == null ? DateTime.now() : initDate,
          onDateTimeChanged: onDateTimeChanged,
        ),
      ),
    );
