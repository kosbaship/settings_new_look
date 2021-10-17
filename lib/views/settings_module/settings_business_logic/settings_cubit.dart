import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_new_look/data/models/schadule_doctor_fixed_model.dart';
import 'package:settings_new_look/data/remote/api_helper.dart';
import 'package:settings_new_look/utilities/app_enums.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/settings_business_logic/settings_states.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  ScheduleDoctorFixedModel _doctorSettings;

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
  TextEditingController examinationPriceController = TextEditingController();

  _checkExaminationPriceTextFieldValidation() =>
      this.formKey.currentState.validate();

  activateDay(bool expandedTilesValue, index) {
    this._doctorSettings.result.clinic.workingDays[index].wdayActiveDay =
        expandedTilesValue ? 1.toString() : 0.toString();
    emit(SettingsChangeExpandedTilesValueState());
  }

  enableSecondShift(dayListItemIndex) {
    this
        ._doctorSettings
        .result
        .clinic
        .workingDays[dayListItemIndex]
        .wdayActiveShift = 1.toString();
    emit(SettingsEnableSecondShiftDurationState());
  }

  disableSecondShift(dayListItemIndex) {
    this
        ._doctorSettings
        .result
        .clinic
        .workingDays[dayListItemIndex]
        .wdayActiveShift = 0.toString();
    emit(SettingsDisableSecondShiftDurationState());
  }

  changeFirstShiftExaminationDurationDropdownValue(
      examinationDurationDropdownValue, dayListItemIndex) {
    this
        ._doctorSettings
        .result
        .clinic
        .workingDays[dayListItemIndex]
        .wdayDuration = examinationDurationDropdownValue;
    emit(SettingsChangeExaminationDurationState());
  }

  changeSecondShiftExaminationDurationDropdownValue(
      examinationDurationDropdownValue, dayListItemIndex) {
    this
        ._doctorSettings
        .result
        .clinic
        .workingDays[dayListItemIndex]
        .wdayDuration2 = examinationDurationDropdownValue;
    emit(SettingsChangeExaminationDurationState());
  }

  DateTime fullDatTime = DateTime.now();

  confirmSelectedDate(dayListItemIndex, ShiftType shiftType) {
    switch (shiftType) {
      case ShiftType.FirstShiftStart:
        this
            ._doctorSettings
            .result
            .clinic
            .workingDays[dayListItemIndex]
            .wdayFrom = '${fullDatTime.hour}:${fullDatTime.minute}';
        break;
      case ShiftType.FirstShiftEnd:
        this
            ._doctorSettings
            .result
            .clinic
            .workingDays[dayListItemIndex]
            .wdayTo = '${fullDatTime.hour}:${fullDatTime.minute}';
        break;
      case ShiftType.SecondShiftStart:
        this
            ._doctorSettings
            .result
            .clinic
            .workingDays[dayListItemIndex]
            .wdayFrom2 = '${fullDatTime.hour}:${fullDatTime.minute}';
        break;
      case ShiftType.SecondShiftEnd:
        this
            ._doctorSettings
            .result
            .clinic
            .workingDays[dayListItemIndex]
            .wdayTo2 = '${fullDatTime.hour}:${fullDatTime.minute}';
        break;
      default:
        break;
    }

    emit(SettingsConfirmSelectedDateState());
  }

  selectDate(dateTime) {
    print('dateTime $dateTime');
    fullDatTime = dateTime;
    emit(SettingsSelectDateState());
  }

  getDoctorSettingsData() {
    emit(SettingsLoadingDataInProgressState());
    ApiHelper.getInstance
        .getDoctorSettingsData()
        .then((_scheduleDoctorFixedModel) {
      this._doctorSettings = _scheduleDoctorFixedModel;

      /// Clinic => Fixed Dates
      //Examination Price
      this.examinationPriceController.text =
          this._doctorSettings.result.clinic.priceValue.toString() ?? '0';

      emit(SettingsLoadingDataSuccessState());
    });
  }

  ScheduleDoctorFixedModel get doctorSettings => _doctorSettings;

  /// ======================================================
  saveAllTheSettings() {
    if (this._checkExaminationPriceTextFieldValidation()) {
      print('Saving Data and show loading Bar');
    }
  }
}
