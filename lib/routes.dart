import 'package:get/get.dart';
import 'screens/signin/signIn.dart';
import 'screens/signin/forgetPassword.dart';
import 'screens/signin/newPassword.dart';
import 'screens/signin/passwordChanged.dart';
import 'screens/signin/successfulRegistration.dart';

class Routes {
  static final routes = [
    GetPage(name: '/sign_in', page: () => SignIn()),
    GetPage(name: '/forgot_password', page: () => ForgetPassword()),
  ];
}

