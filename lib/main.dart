import 'package:flutter/material.dart';
import 'package:myapp/screens/signin/successfulRegistration.dart';
import 'package:myapp/screens/welcome.dart';
import 'package:myapp/screens/signin/signIn.dart';
import 'package:myapp/screens/signin/forgetPassword.dart';
import 'package:myapp/screens/signin/newPassword.dart';
import 'package:myapp/screens/signin/login.dart';
import 'package:myapp/screens/signin/passwordChanged.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NewPassword(),
    routes: {
      '/signin': (context) => SignIn(),
      '/forgetPassword': (context) => ForgetPassword(),

    },
  )
);