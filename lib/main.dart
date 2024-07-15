import 'package:flutter/material.dart';
import 'package:myapp/screens/welcome.dart';
import 'package:myapp/screens/signin/login.dart';
import 'package:myapp/screens/signin/signIn.dart';
import 'package:myapp/screens/signin/successfulRegistration.dart';
import 'package:myapp/screens/signin/forgetPassword.dart';
import 'package:myapp/screens/signin/newPassword.dart';
import 'package:myapp/screens/signin/passwordChanged.dart';
import 'package:myapp/screens/Home/home_page.dart';
import 'package:myapp/screens/profile/profile.dart';
import 'package:myapp/screens/profile/edit_profile.dart';
import 'package:myapp/screens/profile/change_email.dart';
import 'package:myapp/screens/profile/change_email_confirmation.dart';
import 'package:myapp/screens/profile/change_password.dart';
import 'package:myapp/screens/profile/change_password_confirmation.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
      routes: {
        '/signin': (context) => SignIn(),
        '/forgetPassword': (context) => ForgetPassword(),
        '/login': (context) => LogIn(),
        '/home': (context) => HomePage(),
        '/profile': (context) => Profile(),
        '/profile/edit': (context) => EditProfile(),
        '/profile/change_email': (context) => ChangeEmail(),
        '/profile/change_email/confirmation': (context) =>
            ChangeEmailConfirmation(),
        '/profile/change_password': (context) => ChangePassword(),
        '/profile/change_password/confirmation': (context) =>
            ChangePasswordConfirmation(),
      },
    ));
