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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['sub_message'] = this.subMessage;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fixedDate != null) {
      data['fixed_date'] = this.fixedDate.toJson();
    }
    if (this.firstInFirstOut != null) {
      data['first_in_first_out'] = this.firstInFirstOut.toJson();
    }
    return data;
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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fdClinic != null) {
      data['fd_clinic'] = this.fdClinic.toJson();
    }
    if (this.fdCall != null) {
      data['fd_call'] = this.fdCall.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fd_vendorAppointType'] = this.fdVendorAppointType;
    data['fd_confirm_schedule'] = this.fdConfirmSchedule;
    data['fd_priceValue'] = this.fdPriceValue;
    if (this.fdWorkingDays != null) {
      data['fd_working_days'] =
          this.fdWorkingDays.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fd_wday_day_name'] = this.fdWdayDayName;
    data['fd_wday_from'] = this.fdWdayFrom;
    data['fd_wday_to'] = this.fdWdayTo;
    data['fd_wday_from_2'] = this.fdWdayFrom2;
    data['fd_wday_to_2'] = this.fdWdayTo2;
    data['fd_wday_duration'] = this.fdWdayDuration;
    data['fd_wday_duration2'] = this.fdWdayDuration2;
    data['fd_wday_active_day'] = this.fdWdayActiveDay;
    data['fd_wday_active_shift'] = this.fdWdayActiveShift;
    return data;
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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fd_vendorAppointType'] = this.fdVendorAppointType;
    data['fd_priceVideo'] = this.fdPriceVideo;
    data['fd_activeVideo'] = this.fdActiveVideo;
    data['fd_priceVoice'] = this.fdPriceVoice;
    data['fd_activeVoice'] = this.fdActiveVoice;
    data['fd_priceSpot'] = this.fdPriceSpot;
    data['fd_activeSpot'] = this.fdActiveSpot;
    if (this.fdWorkingDays != null) {
      data['fd_working_days'] =
          this.fdWorkingDays.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FirstInFirstOut {
  FnClinic fnClinic;

  FirstInFirstOut.fromJson(Map<String, dynamic> json) {
    fnClinic = json['fn_clinic'] != null
        ? new FnClinic.fromJson(json['fn_clinic'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fnClinic != null) {
      data['fn_clinic'] = this.fnClinic.toJson();
    }
    return data;
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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fn_vendorAppointType'] = this.fnVendorAppointType;
    data['fn_confirm_schedule'] = this.fnConfirmSchedule;
    data['fn_priceValue'] = this.fnPriceValue;
    if (this.fnWorkingDays != null) {
      data['fn_working_days'] =
          this.fnWorkingDays.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fn_wday_day_name'] = this.fnWdayDayName;
    data['fn_wday_from'] = this.fnWdayFrom;
    data['fn_wday_to'] = this.fnWdayTo;
    data['fn_wday_duration'] = this.fnWdayDuration;
    data['fn_wday_from_2'] = this.fnWdayFrom2;
    data['fn_wday_to_2'] = this.fnWdayTo2;
    data['fn_wday_duration2'] = this.fnWdayDuration2;
    data['fn_wday_active_day'] = this.fnWdayActiveDay;
    data['fn_wday_active_shift'] = this.fnWdayActiveShift;
    return data;
  }
}
