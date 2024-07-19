import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/signin/successfulRegistration.dart';
import 'package:myapp/screens/Home/home_page.dart';
import 'package:myapp/screens/signin/enterCode.dart';
import 'package:myapp/screens/signin/succesfulChangePassword.dart';
import 'package:myapp/screens/welcome.dart';
import 'package:myapp/screens/signin/signIn.dart';
import 'package:myapp/screens/signin/successfulRegistration.dart';
import 'package:myapp/screens/signin/forgetPassword.dart';
import 'package:myapp/screens/signin/newPassword.dart';
import 'package:myapp/screens/signin/signUp.dart';
import 'package:myapp/screens/signin/passwordChanged.dart';
import 'package:myapp/controllers/authController.dart'; // Asegúrate de crear este archivo
import 'package:myapp/screens/Home/homeSessioned.dart';
import 'package:myapp/screens/profile/profile.dart';
import 'package:myapp/screens/profile/edit_profile.dart';
import 'package:myapp/screens/profile/change_email.dart';
import 'package:myapp/screens/profile/change_email_confirmation.dart';
import 'package:myapp/screens/profile/change_password.dart';
import 'package:myapp/screens/profile/change_password_confirmation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController()); // Inicializa el AuthController
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kobe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthWrapper(),
      getPages: [
        GetPage(name: '/signin', page: () => SignIn()),
        GetPage(name: '/forgetPassword', page: () => ForgetPassword()),
        GetPage(name: '/signUp', page: () => SignUp()),
        GetPage(name: '/home', page: () => HomePage()),
        //GetPage(name: '/homeSessioned', page: () => HomePageSessioned()),
        GetPage(
            name: '/successfulRegistration',
            page: () => SuccessfulRegistration()),
        //GetPage(name: '/enterCode', page: () => EnterCode()),
        GetPage(
            name: '/successfulChangePassword',
            page: () => SuccessfulChangePassword()),
        //GetPage(name: '/welcome', page: () => Welcome()),
        //GetPage(name: '/newPassword', page: () => NewPassword()),
        //GetPage(name: '/passwordChanged', page: () => PasswordChanged()),
        GetPage(name: '/profile', page: () => Profile()),
        GetPage(name: '/profile/edit', page: () => EditProfile()),
        GetPage(name: '/profile/change_email', page: () => ChangeEmail()),
        GetPage(
            name: '/profile/change_email/confirmation',
            page: () => ChangeEmailConfirmation()),
        GetPage(name: '/profile/change_password', page: () => ChangePassword()),
        GetPage(
            name: '/profile/change_password/confirmation',
            page: () => ChangePasswordConfirmation()),
      ],
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return FutureBuilder<String?>(
          future: controller.getToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                
                return HomePageSessioned();
              } else {
                return SignIn();
              }
            } else {
              // En caso de error o conexión no realizada
              return SignIn();
            }
          },
        );
      },
    );
  }
}
