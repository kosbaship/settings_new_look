class DoctorScheduleData {
  int status;
  String subMessage;
  String message;
  Result result;

  DoctorScheduleData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    subMessage = json['sub_message'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }
}

class Result {
  FixedDate fixedDate;
  FirstInFirstOut firstInFirstOut;

  Result.fromJson(Map<String, dynamic> json) {
    fixedDate = json['fixed_date'] != null
        ? new FixedDate.fromJson(json['fixed_date'])
        : null;
    firstInFirstOut = json['first_in_first_out'] != null
        ? new FirstInFirstOut.fromJson(json['first_in_first_out'])
        : null;
  }
}

class FixedDate {
  FdClinic fdClinic;
  FdCall fdCall;

  FixedDate.fromJson(Map<String, dynamic> json) {
    fdClinic = json['fd_clinic'] != null
        ? new FdClinic.fromJson(json['fd_clinic'])
        : null;
    fdCall =
        json['fd_call'] != null ? new FdCall.fromJson(json['fd_call']) : null;
  }
}

class FdClinic {
  String fdVendorAppointType;
  String fdConfirmSchedule;
  int fdPriceValue;
  List<FdWorkingDays> fdWorkingDays;

  FdClinic.fromJson(Map<String, dynamic> json) {
    fdVendorAppointType = json['fd_vendorAppointType'];
    fdConfirmSchedule = json['fd_confirm_schedule'];
    fdPriceValue = json['fd_priceValue'];
    if (json['fd_working_days'] != null) {
      fdWorkingDays = <FdWorkingDays>[];
      json['fd_working_days'].forEach((v) {
        fdWorkingDays.add(new FdWorkingDays.fromJson(v));
      });
    }
  }
}

class FdWorkingDays {
  String fdWdayDayName;
  String fdWdayFrom;
  String fdWdayTo;
  String fdWdayFrom2;
  String fdWdayTo2;
  String fdWdayDuration;
  String fdWdayDuration2;
  String fdWdayActiveDay;
  String fdWdayActiveShift;

  FdWorkingDays.fromJson(Map<String, dynamic> json) {
    fdWdayDayName = json['fd_wday_day_name'];
    fdWdayFrom = json['fd_wday_from'];
    fdWdayTo = json['fd_wday_to'];
    fdWdayFrom2 = json['fd_wday_from_2'];
    fdWdayTo2 = json['fd_wday_to_2'];
    fdWdayDuration = json['fd_wday_duration'];
    fdWdayDuration2 = json['fd_wday_duration2'];
    fdWdayActiveDay = json['fd_wday_active_day'];
    fdWdayActiveShift = json['fd_wday_active_shift'];
  }
}

class FdCall {
  String fdVendorAppointType;
  String fdConfirmSchedule;
  int fdPriceVideo;
  String fdActiveVideo;
  int fdPriceVoice;
  String fdActiveVoice;
  int fdPriceSpot;
  String fdActiveSpot;
  List<FdWorkingDays> fdWorkingDays;

  FdCall.fromJson(Map<String, dynamic> json) {
    fdVendorAppointType = json['fd_vendorAppointType'];
    fdConfirmSchedule = json['fd_confirm_schedule'];
    fdPriceVideo = json['fd_priceVideo'];
    fdActiveVideo = json['fd_activeVideo'];
    fdPriceVoice = json['fd_priceVoice'];
    fdActiveVoice = json['fd_activeVoice'];
    fdPriceSpot = json['fd_priceSpot'];
    fdActiveSpot = json['fd_activeSpot'];
    if (json['fd_working_days'] != null) {
      fdWorkingDays = <FdWorkingDays>[];
      json['fd_working_days'].forEach((v) {
        fdWorkingDays.add(new FdWorkingDays.fromJson(v));
      });
    }
  }
}

class FirstInFirstOut {
  FnClinic fnClinic;

  FirstInFirstOut.fromJson(Map<String, dynamic> json) {
    fnClinic = json['fn_clinic'] != null
        ? new FnClinic.fromJson(json['fn_clinic'])
        : null;
  }
}

class FnClinic {
  String fnVendorAppointType;
  String fnConfirmSchedule;
  int fnPriceValue;
  List<FnWorkingDays> fnWorkingDays;

  FnClinic.fromJson(Map<String, dynamic> json) {
    fnVendorAppointType = json['fn_vendorAppointType'];
    fnConfirmSchedule = json['fn_confirm_schedule'];
    fnPriceValue = json['fn_priceValue'];
    if (json['fn_working_days'] != null) {
      fnWorkingDays = <FnWorkingDays>[];
      json['fn_working_days'].forEach((v) {
        fnWorkingDays.add(new FnWorkingDays.fromJson(v));
      });
    }
  }
}

class FnWorkingDays {
  String fnWdayDayName;
  String fnWdayFrom;
  String fnWdayTo;
  String fnWdayDuration;
  String fnWdayFrom2;
  String fnWdayTo2;
  String fnWdayDuration2;
  String fnWdayActiveDay;
  String fnWdayActiveShift;

  FnWorkingDays.fromJson(Map<String, dynamic> json) {
    fnWdayDayName = json['fn_wday_day_name'];
    fnWdayFrom = json['fn_wday_from'];
    fnWdayTo = json['fn_wday_to'];
    fnWdayDuration = json['fn_wday_duration'];
    fnWdayFrom2 = json['fn_wday_from_2'];
    fnWdayTo2 = json['fn_wday_to_2'];
    fnWdayDuration2 = json['fn_wday_duration2'];
    fnWdayActiveDay = json['fn_wday_active_day'];
    fnWdayActiveShift = json['fn_wday_active_shift'];
  }
}
