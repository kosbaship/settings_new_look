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

  /// =================== handle tab bar and selection ========================
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

  final formKey = GlobalKey<FormState>();

  _checkExaminationPriceTextFieldValidation() =>
      this.formKey.currentState.validate();

  /// ================= handle clinic fixed dates ========================

  changeFixedDatesConfirmationScheduleValue(confirmationScheduleValue) {
    this._doctorSchedule.result.fixedDate.fdClinic.fdConfirmSchedule =
        confirmationScheduleValue;
    emit(SettingsConfirmationScheduleTypeState());
  }

  TextEditingController fixedDatesExaminationPriceController =
      TextEditingController();

  DateTime fixedDateFullDatTime = DateTime.now();

  fixedDateConfirmSelectedDate(dayListItemIndex, ShiftType shiftType) {
    switch (shiftType) {
      case ShiftType.FirstShiftStart:
        this
                ._doctorSchedule
                .result
                .fixedDate
                .fdClinic
                .fdWorkingDays[dayListItemIndex]
                .fdWdayFrom =
            '${fixedDateFullDatTime.hour}:${fixedDateFullDatTime.minute}';
        break;
      case ShiftType.FirstShiftEnd:
        this
                ._doctorSchedule
                .result
                .fixedDate
                .fdClinic
                .fdWorkingDays[dayListItemIndex]
                .fdWdayTo =
            '${fixedDateFullDatTime.hour}:${fixedDateFullDatTime.minute}';
        break;
      case ShiftType.SecondShiftStart:
        this
                ._doctorSchedule
                .result
                .fixedDate
                .fdClinic
                .fdWorkingDays[dayListItemIndex]
                .fdWdayFrom2 =
            '${fixedDateFullDatTime.hour}:${fixedDateFullDatTime.minute}';
        break;
      case ShiftType.SecondShiftEnd:
        this
                ._doctorSchedule
                .result
                .fixedDate
                .fdClinic
                .fdWorkingDays[dayListItemIndex]
                .fdWdayTo2 =
            '${fixedDateFullDatTime.hour}:${fixedDateFullDatTime.minute}';
        break;
      default:
        break;
    }

    emit(SettingsConfirmSelectedDateState());
  }

  changeFixedDatesFirstShiftExaminationDurationDropdownValue(
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

  fixedDatesEnableSecondShift(dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .fixedDate
        .fdClinic
        .fdWorkingDays[dayListItemIndex]
        .fdWdayActiveShift = 1.toString();
    emit(SettingsEnableSecondShiftDurationState());
  }

  changeFixedDatesSecondShiftExaminationDurationDropdownValue(
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

  fixedDatesDisableSecondShift(dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .fixedDate
        .fdClinic
        .fdWorkingDays[dayListItemIndex]
        .fdWdayActiveShift = 0.toString();
    emit(SettingsDisableSecondShiftDurationState());
  }

  fixedDatesActivateDay(bool expandedTilesValue, index) {
    this
        ._doctorSchedule
        .result
        .fixedDate
        .fdClinic
        .fdWorkingDays[index]
        .fdWdayActiveDay = expandedTilesValue ? 1.toString() : 0.toString();
    emit(SettingsChangeExpandedTilesValueState());
  }

  fixedDateSelectDate(dateTime) {
    print('dateTime $dateTime');
    fixedDateFullDatTime = dateTime;
    emit(SettingsSelectDateState());
  }

  /// ================= handle clinic first in first out ========================
  changeFirstInFirstOutConfirmationScheduleValue(confirmationScheduleValue) {
    this._doctorSchedule.result.firstInFirstOut.fnClinic.fnConfirmSchedule =
        confirmationScheduleValue;
    emit(SettingsConfirmationScheduleTypeState());
  }

  TextEditingController firstInFirstOutExaminationPriceController =
      TextEditingController();
  DateTime firstInFirstOutFullDatTime = DateTime.now();

  firstInFirstOutConfirmSelectedDate(dayListItemIndex, ShiftType shiftType) {
    switch (shiftType) {
      case ShiftType.FirstShiftStart:
        this
                ._doctorSchedule
                .result
                .firstInFirstOut
                .fnClinic
                .fnWorkingDays[dayListItemIndex]
                .fnWdayFrom =
            '${firstInFirstOutFullDatTime.hour}:${firstInFirstOutFullDatTime.minute}';
        break;
      case ShiftType.FirstShiftEnd:
        print('hesloooooo');

        this
                ._doctorSchedule
                .result
                .firstInFirstOut
                .fnClinic
                .fnWorkingDays[dayListItemIndex]
                .fnWdayTo =
            '${firstInFirstOutFullDatTime.hour}:${firstInFirstOutFullDatTime.minute}';
        break;
      case ShiftType.SecondShiftStart:
        this
                ._doctorSchedule
                .result
                .firstInFirstOut
                .fnClinic
                .fnWorkingDays[dayListItemIndex]
                .fnWdayFrom2 =
            '${firstInFirstOutFullDatTime.hour}:${firstInFirstOutFullDatTime.minute}';
        break;
      case ShiftType.SecondShiftEnd:
        this
                ._doctorSchedule
                .result
                .firstInFirstOut
                .fnClinic
                .fnWorkingDays[dayListItemIndex]
                .fnWdayTo2 =
            '${firstInFirstOutFullDatTime.hour}:${firstInFirstOutFullDatTime.minute}';
        break;
      default:
        break;
    }

    emit(SettingsConfirmSelectedDateState());
  }

  changeFirstInFirstOutFirstShiftExaminationDurationDropdownValue(
      examinationDurationDropdownValue, dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .firstInFirstOut
        .fnClinic
        .fnWorkingDays[dayListItemIndex]
        .fnWdayDuration = examinationDurationDropdownValue;
    emit(SettingsChangeExaminationDurationState());
  }

  firstInFirstOutEnableSecondShift(dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .firstInFirstOut
        .fnClinic
        .fnWorkingDays[dayListItemIndex]
        .fnWdayActiveShift = 1.toString();
    emit(SettingsEnableSecondShiftDurationState());
  }

  changeFirstInFirstOutSecondShiftExaminationDurationDropdownValue(
      examinationDurationDropdownValue, dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .firstInFirstOut
        .fnClinic
        .fnWorkingDays[dayListItemIndex]
        .fnWdayDuration2 = examinationDurationDropdownValue;
    emit(SettingsChangeExaminationDurationState());
  }

  firstInFirstOutDisableSecondShift(dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .firstInFirstOut
        .fnClinic
        .fnWorkingDays[dayListItemIndex]
        .fnWdayActiveShift = 0.toString();
    emit(SettingsDisableSecondShiftDurationState());
  }

  firstInFirstOutActivateDay(bool expandedTilesValue, index) {
    this
        ._doctorSchedule
        .result
        .firstInFirstOut
        .fnClinic
        .fnWorkingDays[index]
        .fnWdayActiveDay = expandedTilesValue ? 1.toString() : 0.toString();
    emit(SettingsChangeExpandedTilesValueState());
  }

  firstInFirstOutSelectDate(dateTime) {
    print('dateTime $dateTime');
    firstInFirstOutFullDatTime = dateTime;
    emit(SettingsSelectDateState());
  }

  /// ================= handle Call Timings ========================
  TextEditingController callPriceController = TextEditingController();
  TextEditingController videoPriceController = TextEditingController();
  TextEditingController spotPriceController = TextEditingController();

  activateVideoCall(bool expandedTilesValue) {
    this._doctorSchedule.result.fixedDate.fdCall.fdActiveVideo =
        expandedTilesValue ? 1.toString() : 0.toString();
    emit(SettingsChangeExpandedTilesValueState());
  }

  activateSpotCall(bool expandedTilesValue) {
    this._doctorSchedule.result.fixedDate.fdCall.fdActiveSpot =
        expandedTilesValue ? 1.toString() : 0.toString();
    emit(SettingsChangeExpandedTilesValueState());
  }

  DateTime callsTimeFullDatTime = DateTime.now();

  callsTimeConfirmSelectedDate(dayListItemIndex, ShiftType shiftType) {
    switch (shiftType) {
      case ShiftType.FirstShiftStart:
        this
                ._doctorSchedule
                .result
                .fixedDate
                .fdCall
                .fdWorkingDays[dayListItemIndex]
                .fdWdayFrom =
            '${callsTimeFullDatTime.hour}:${callsTimeFullDatTime.minute}';
        break;
      case ShiftType.FirstShiftEnd:
        this
                ._doctorSchedule
                .result
                .fixedDate
                .fdCall
                .fdWorkingDays[dayListItemIndex]
                .fdWdayTo =
            '${callsTimeFullDatTime.hour}:${callsTimeFullDatTime.minute}';
        break;
      case ShiftType.SecondShiftStart:
        this
                ._doctorSchedule
                .result
                .fixedDate
                .fdCall
                .fdWorkingDays[dayListItemIndex]
                .fdWdayFrom2 =
            '${callsTimeFullDatTime.hour}:${callsTimeFullDatTime.minute}';
        break;
      case ShiftType.SecondShiftEnd:
        this
                ._doctorSchedule
                .result
                .fixedDate
                .fdCall
                .fdWorkingDays[dayListItemIndex]
                .fdWdayTo2 =
            '${callsTimeFullDatTime.hour}:${callsTimeFullDatTime.minute}';
        break;
      default:
        break;
    }

    emit(SettingsConfirmSelectedDateState());
  }

  callsTimeDatesFirstShiftExaminationDurationDropdownValue(
      examinationDurationDropdownValue, dayListItemIndex) {
    this
        ._doctorSchedule
        .result
        .fixedDate
        .fdCall
        .fdWorkingDays[dayListItemIndex]
        .fdWdayDuration = examinationDurationDropdownValue;
    emit(SettingsChangeExaminationDurationState());
  }

  callsTimeActivateDay(bool expandedTilesValue, index) {
    this
        ._doctorSchedule
        .result
        .fixedDate
        .fdCall
        .fdWorkingDays[index]
        .fdWdayActiveDay = expandedTilesValue ? 1.toString() : 0.toString();
    emit(SettingsChangeExpandedTilesValueState());
  }

  callsTimeSelectDate(dateTime) {
    print('dateTime $dateTime');
    callsTimeFullDatTime = dateTime;
    emit(SettingsSelectDateState());
  }

  /// ========= get data from the server =======================
  DoctorScheduleData _doctorSchedule;

  getScheduleDoctor() {
    emit(SettingsLoadingDataInProgressState());
    ApiHelper.getInstance.getDoctorSchedule().then((_doctorScheduleModel) {
      this._doctorSchedule = _doctorScheduleModel;

      /// Clinic => Fixed Dates
      //Examination Price
      this.fixedDatesExaminationPriceController.text = this
              ._doctorSchedule
              .result
              .fixedDate
              .fdClinic
              .fdPriceValue
              .toString() ??
          '0';

      /// Clinic => First In First Out Dates
      //Examination Price
      this.firstInFirstOutExaminationPriceController.text = this
              ._doctorSchedule
              .result
              .firstInFirstOut
              .fnClinic
              .fnPriceValue
              .toString() ??
          '0';

      /// Call => Voice
      this.callPriceController.text = this
              ._doctorSchedule
              .result
              .fixedDate
              .fdCall
              .fdPriceVoice
              .toString() ??
          '0';

      /// Call => video
      this.videoPriceController.text = this
              ._doctorSchedule
              .result
              .fixedDate
              .fdCall
              .fdPriceVideo
              .toString() ??
          '0';

      /// Call => spot
      this.spotPriceController.text =
          this._doctorSchedule.result.fixedDate.fdCall.fdPriceSpot.toString() ??
              '0';

      emit(SettingsLoadingDataSuccessState());
    }).onError((errorMessage, stackTrace) {
      emit(SettingsErrorLoadingDataState(errorMessage.toString()));
    });
  }

  setScheduleDoctor() {
    emit(SettingsLoadingDataInProgressState());
    ApiHelper.getInstance.updateDoctorSchedule(_doctorSchedule).then((_) {
      print('SettingsLoadingDataInProgressState');
      print('SettingsLoadingDataInProgressState');
      print('SettingsLoadingDataInProgressState');
      print('SettingsLoadingDataInProgressState');
      emit(SettingsLoadingDataSuccessState());
    }).onError((errorMessage, stackTrace) {
      emit(SettingsErrorLoadingDataState(errorMessage.toString()));
    });
  }

  DoctorScheduleData get doctorSchedule => _doctorSchedule;

  /// ======================================================
  saveAllTheSettings() {
    if (this._checkExaminationPriceTextFieldValidation()) setScheduleDoctor();
  }
}
