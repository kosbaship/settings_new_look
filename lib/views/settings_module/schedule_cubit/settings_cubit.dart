import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_new_look/data/models/doctor_schadule_model.dart';
import 'package:settings_new_look/data/remote/api_helper.dart';
import 'package:settings_new_look/utilities/app_enums.dart';
import 'package:settings_new_look/utilities/app_strings.dart';
import 'package:settings_new_look/views/settings_module/schedule_cubit/settings_states.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  DoctorScheduleData _doctorSchedule;

  int tabBarIndex = 0;

  changeTabBarIndex(index) {
    this.tabBarIndex = index;
    emit(SettingsChangeTabBarIndexState());
  }

  String examinationDropdownValue = kExaminationDropdownInitialValue;

  changeExaminationDropdownValue(examinationDropdownValue) {
    print('====================');
    print('$examinationDropdownValue');
    print('====================');
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
    this
        ._doctorSchedule
        .result
        .fixedDate
        .fdClinic
        .fdWorkingDays[index]
        .fdWdayActiveDay = expandedTilesValue ? 1.toString() : 0.toString();
    emit(SettingsChangeExpandedTilesValueState());
  }

  enableSecondShift(dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .fixedDate
        .fdClinic
        .fdWorkingDays[dayListItemIndex]
        .fdWdayActiveShift = 1.toString();
    emit(SettingsEnableSecondShiftDurationState());
  }

  disableSecondShift(dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .fixedDate
        .fdClinic
        .fdWorkingDays[dayListItemIndex]
        .fdWdayActiveShift = 0.toString();
    emit(SettingsDisableSecondShiftDurationState());
  }

  changeFirstShiftExaminationDurationDropdownValue(
      examinationDurationDropdownValue, dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .fixedDate
        .fdClinic
        .fdWorkingDays[dayListItemIndex]
        .fdWdayDuration = examinationDurationDropdownValue;
    emit(SettingsChangeExaminationDurationState());
  }

  changeSecondShiftExaminationDurationDropdownValue(
      examinationDurationDropdownValue, dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .fixedDate
        .fdClinic
        .fdWorkingDays[dayListItemIndex]
        .fdWdayDuration2 = examinationDurationDropdownValue;
    emit(SettingsChangeExaminationDurationState());
  }

  DateTime fullDatTime = DateTime.now();

  confirmSelectedDate(dayListItemIndex, ShiftType shiftType) {
    switch (shiftType) {
      case ShiftType.FirstShiftStart:
        this
            ._doctorSchedule
            .result
            .fixedDate
            .fdClinic
            .fdWorkingDays[dayListItemIndex]
            .fdWdayFrom = '${fullDatTime.hour}:${fullDatTime.minute}';
        break;
      case ShiftType.FirstShiftEnd:
        this
            ._doctorSchedule
            .result
            .fixedDate
            .fdClinic
            .fdWorkingDays[dayListItemIndex]
            .fdWdayTo = '${fullDatTime.hour}:${fullDatTime.minute}';
        break;
      case ShiftType.SecondShiftStart:
        this._doctorSchedule.result
          ..fixedDate.fdClinic.fdWorkingDays[dayListItemIndex].fdWdayFrom2 =
              '${fullDatTime.hour}:${fullDatTime.minute}';
        break;
      case ShiftType.SecondShiftEnd:
        this
            ._doctorSchedule
            .result
            .fixedDate
            .fdClinic
            .fdWorkingDays[dayListItemIndex]
            .fdWdayTo2 = '${fullDatTime.hour}:${fullDatTime.minute}';
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

  getScheduleDoctorFixed() {
    emit(SettingsLoadingDataInProgressState());
    ApiHelper.getInstance
        .getScheduleDoctorFixed()
        .then((_scheduleDoctorFixedModel) {
      this._doctorSchedule = _scheduleDoctorFixedModel;

      /// Clinic => Fixed Dates
      //Examination Price
      this.examinationPriceController.text = this
              ._doctorSchedule
              .result
              .fixedDate
              .fdClinic
              .fdPriceValue
              .toString() ??
          '0';

      emit(SettingsLoadingDataSuccessState());
    }).onError((errorMessage, stackTrace) {
      emit(SettingsErrorLoadingDataState(errorMessage.toString()));
    });
  }

  DoctorScheduleData get doctorSchedule => _doctorSchedule;

  /// ======================================================
  saveAllTheSettings() {
    if (this._checkExaminationPriceTextFieldValidation()) {
      print('Saving Data and show loading Bar');
    }
  }
}
