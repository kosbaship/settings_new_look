import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_states.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  int tabBarIndex = 0;

  changeTabBarIndex(index) {
    this.tabBarIndex = index;
    emit(SettingsChangeTabBarIndexState());
  }

  String examinationDropdownValue = kExaminationDropdownInitialValue;

  changeExaminationDropdownValue(examinationDropdownValue) {
    this.examinationDropdownValue = examinationDropdownValue;
    emit(SettingsChangeExaminationTypeState());
  }

  String confirmationScheduleValue = kConfirmationScheduleDropdownInitialValue;

  changeConfirmationScheduleValue(confirmationScheduleValue) {
    this.confirmationScheduleValue = confirmationScheduleValue;
    emit(SettingsConfirmationScheduleTypeState());
  }

  final formKey = GlobalKey<FormState>();
  final examinationPriceController = TextEditingController();

  _checkExaminationPriceTextFieldValidation() =>
      this.formKey.currentState.validate();

  List<bool> expandedTilesValue = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  changeExpandedTilesValue(expandedTilesValue, index) {
    this.expandedTilesValue[index] = expandedTilesValue;
    emit(SettingsChangeExpandedTilesValueState());
  }

  String examinationDurationDropdownValue =
      kExaminationDurationDropdownInitialValue;

  changeExaminationDurationDropdownValue(examinationDurationDropdownValue) {
    this.examinationDurationDropdownValue = examinationDurationDropdownValue;
    emit(SettingsChangeExaminationDurationState());
  }

  List<List<int>> listOfWorkTimeDayExaminationDurationItemLength = [
    [1, 2],
    [1, 2],
    [1, 2],
    [1, 2],
    [1, 2],
    [1, 2],
    [1, 2],
  ];

  /// ======================================================
  saveAllTheSettings() {
    if (this._checkExaminationPriceTextFieldValidation()) {
      print('Saving Data and show loading Bar');
    }
  }
}
