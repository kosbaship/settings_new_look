import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:settings_new_look/data/models/schadule_doctor_fixed_model.dart';
import 'package:settings_new_look/utilities/app_exceptions.dart';
import 'package:settings_new_look/utilities/app_strings.dart';

import 'api_util.dart';

class ApiHelper {
  static ApiHelper _instance = ApiHelper();

  static ApiHelper get getInstance => _instance;

  Future<ScheduleDoctorFixedModel> getScheduleDoctorFixed() async {
    await checkInternetConnection();
    var parameters = {
      kAccessKey: ACCESS_KEY_VALUE,
      kAccessPassword: ACCESS_PASSWORD_VALUE,
      'doctorId': '1004',
      // =========================================> will be changed in the production
    };

    http.Response response =
        await http.post(Uri.parse(GET_DOCTOR_END_POINT), body: parameters);
    ScheduleDoctorFixedModel doctorSettings;
    switch (response.statusCode) {
      case 200:
        doctorSettings =
            ScheduleDoctorFixedModel.fromJson(jsonDecode(response.body));
        print('Status ${doctorSettings.status}');
        print(doctorSettings.subMessage);
        print(doctorSettings.message);
        print(doctorSettings.result.examinationType);
        return doctorSettings;
        break;
      case 404:
        throw ErrorNotFoundException(message: 'Doctor Settings');
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
