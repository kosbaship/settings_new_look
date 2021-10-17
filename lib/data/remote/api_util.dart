import 'package:connectivity/connectivity.dart';
import 'package:settings_new_look/utilities/app_exceptions.dart';

const String ACCESS_KEY_VALUE = 'Jd5522SA523aaaW2e25e5rk';
const String ACCESS_PASSWORD_VALUE = 'J52Df3e6Wrtt5F2eeeWq220';

const String _BASE_URL = 'https://dev.rojetah.com/app_services/';
const GET_DOCTOR_END_POINT = _BASE_URL + 'getScheduleDoctorFixed';
const UPDATE_DOCTOR_END_POINT = _BASE_URL + 'updateScheduleDoctor';

Future<void> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.mobile &&
      connectivityResult != ConnectivityResult.wifi)
    throw NoInternetConnectionException();
}
