import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
