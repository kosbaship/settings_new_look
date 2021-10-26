import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:settings_new_look/data/models/doctor_schadule_model.dart';
import 'package:settings_new_look/utilities/app_exceptions.dart';
import 'package:settings_new_look/utilities/app_strings.dart';

import 'api_util.dart';

class ApiHelper {
  static ApiHelper _instance = ApiHelper();

  static ApiHelper get getInstance => _instance;

  Future<DoctorScheduleData> getDoctorSchedule() async {
    await checkInternetConnection();
    var parameters = {
      kAccessKey: ACCESS_KEY_VALUE,
      kAccessPassword: ACCESS_PASSWORD_VALUE,

      /// =========================================> will be changed in the production
      'doctorId': '1004',
    };

    http.Response response = await http
        .post(Uri.parse(GET_DOCTOR_SCHEDULE_END_POINT), body: parameters);

    switch (response.statusCode) {
      case 200:
        return DoctorScheduleData.fromJson(jsonDecode(response.body));
        break;
      case 404:
        throw ErrorNotFoundException(message: 'Doctor Schedule');
        break;
      case 500:
      case 501:
        throw ServerDownException();
        break;
      default:
        return null;
        break;
    }
  }

  Future<String> updateDoctorSchedule(DoctorScheduleData doctorSchedule) async {
    await checkInternetConnection();
    Map<String, dynamic> parameters = {
      kAccessKey: ACCESS_KEY_VALUE,
      kAccessPassword: ACCESS_PASSWORD_VALUE,

      /// =========================================> will be changed in the production
      'doctorId': '1004',
      'fixed_date': jsonEncode(doctorSchedule.result.fixedDate.toJson()),
      'first_in_first_out':
          jsonEncode(doctorSchedule.result.firstInFirstOut.toJson()),
    };
    print('fixedDate ${jsonEncode(doctorSchedule.result.fixedDate.toJson())}');
    print(
        'firstInFirstOut ${jsonEncode(doctorSchedule.result.firstInFirstOut.toJson())}');

    http.Response response = await http
        .post(Uri.parse(UPDATE_DOCTOR_SCHEDULE_END_POINT), body: parameters);

    switch (response.statusCode) {
      case 200:
        print('Body: =======> ${response.body}');
        return 'Doctor\'s Schedule have been updated successfully';
        break;
      case 404:
        throw ErrorNotFoundException(message: 'Doctor Schedule');
        break;
      case 500:
      case 501:
        throw ServerDownException();
        break;
      default:
        return null;
        break;
    }
  }
}
