class DoctorSettings {
  int status;
  String subMessage;
  String message;
  Result result;

  DoctorSettings.fromJson(Map<String, dynamic> json) {
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
  List<AvailabilityList> availabilityList;

  Result.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendorId'];
    vendorType = json['vendorType'];
    if (json['availabilityList'] != null) {
      availabilityList = new List<AvailabilityList>();
      json['availabilityList'].forEach((v) {
        availabilityList.add(new AvailabilityList.fromJson(v));
      });
    }
  }
}

class AvailabilityList {
  String vendorAppointType;
  int isActive;
  String priceValue;
  List<AvailabilityTimeList> availabilityTimeList;

  AvailabilityList.fromJson(Map<String, dynamic> json) {
    vendorAppointType = json['vendorAppointType'];
    isActive = json['isActive'];
    priceValue = json['priceValue'];
    if (json['availabilityTimeList'] != null) {
      availabilityTimeList = new List<AvailabilityTimeList>();
      json['availabilityTimeList'].forEach((v) {
        availabilityTimeList.add(new AvailabilityTimeList.fromJson(v));
      });
    }
  }
}

class AvailabilityTimeList {
  String wdayDayName;
  String wdayFrom;
  String wdayTo;
  String wdayFrom2;
  String wdayTo2;

  AvailabilityTimeList.fromJson(Map<String, dynamic> json) {
    wdayDayName = json['wday_day_name'];
    wdayFrom = json['wday_from'];
    wdayTo = json['wday_to'];
    wdayFrom2 = json['wday_from_2'];
    wdayTo2 = json['wday_to_2'];
  }
}
