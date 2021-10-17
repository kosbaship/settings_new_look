class ScheduleDoctorFixedModel {
  int status;
  String subMessage;
  String message;
  Result result;

  ScheduleDoctorFixedModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    subMessage = json['sub_message'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }
}

class Result {
  String vendorId;
  String vendorType;
  String examinationType;
  Clinic clinic;
  Call call;

  Result.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendorId'];
    vendorType = json['vendorType'];
    examinationType = json['examination_type'];
    clinic =
        json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    call = json['call'] != null ? new Call.fromJson(json['call']) : null;
  }
}

class Clinic {
  String vendorAppointType;
  String confirmSchedule;
  int isActive;
  int priceValue;
  List<WorkingDays> workingDays;

  Clinic.fromJson(Map<String, dynamic> json) {
    vendorAppointType = json['vendorAppointType'];
    confirmSchedule = json['confirm_schedule'];
    isActive = json['isActive'];
    priceValue = json['priceValue'];
    if (json['working_days'] != null) {
      workingDays = new List<WorkingDays>();
      json['working_days'].forEach((v) {
        workingDays.add(new WorkingDays.fromJson(v));
      });
    }
  }
}

class WorkingDays {
  String wdayDayName;
  String wdayFrom;
  String wdayTo;
  String wdayFrom2;
  String wdayTo2;
  String wdayDuration;
  String wdayDuration2;
  String wdayActiveDay;

  WorkingDays.fromJson(Map<String, dynamic> json) {
    wdayDayName = json['wday_day_name'];
    wdayFrom = json['wday_from'];
    wdayTo = json['wday_to'];
    wdayFrom2 = json['wday_from_2'];
    wdayTo2 = json['wday_to_2'];
    wdayDuration = json['wday_duration'];
    wdayDuration2 = json['wday_duration2'];
    wdayActiveDay = json['wday_active_day'];
  }
}

class Call {
  String vendorAppointType;
  String confirmSchedule;
  int isActive;
  int priceVideo;
  int priceVoice;
  int priceSpot;
  List<WorkingDays> workingDays;

  Call.fromJson(Map<String, dynamic> json) {
    vendorAppointType = json['vendorAppointType'];
    confirmSchedule = json['confirm_schedule'];
    isActive = json['isActive'];
    priceVideo = json['priceVideo'];
    priceVoice = json['PriceVoice'];
    priceSpot = json['PriceSpot'];
    if (json['working_days'] != null) {
      workingDays = <WorkingDays>[];
      json['working_days'].forEach((v) {
        workingDays.add(new WorkingDays.fromJson(v));
      });
    }
  }
}
