import '../utils/env.dart';

class Endpoints {
  static String baseUrl = Env.baseUrl;

  static String login = '/users/v1/do_login';
  static String profile = '/users/v1/profile';
  static String updateProfile = '/users/v1/update/profile';
}
