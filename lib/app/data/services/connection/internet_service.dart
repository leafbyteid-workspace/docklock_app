import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetService {
  InternetService._();

  static Future<bool> hasConnection() async {
    return await InternetConnection().hasInternetAccess;
  }
}
