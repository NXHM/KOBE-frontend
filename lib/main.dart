import 'package:flutter/material.dart';
import 'package:myapp/screens/signin/successfulRegistration.dart';
import 'package:myapp/screens/Home/home_page.dart';
import 'package:myapp/screens/welcome.dart';
import 'package:myapp/screens/signin/signIn.dart';
import 'package:myapp/screens/signin/forgetPassword.dart';
import 'package:myapp/screens/signin/newPassword.dart';
import 'package:myapp/screens/signin/signUp.dart';
import 'package:myapp/screens/signin/passwordChanged.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
      routes: {
        '/signin': (context) => SignIn(),
        '/forgetPassword': (context) => ForgetPassword(),
        '/signUp': (context) => SignUp(),
        '/home': (context) => HomePage(),
      },
    ));
