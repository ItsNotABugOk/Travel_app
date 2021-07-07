import 'package:flutter/material.dart';
import 'package:travel_app/firebase/sign_in_page.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/sign_out_screen.dart';




class Navigate {
  static Map<String, Widget Function(BuildContext)> routes =   {
    '/' : (context) => SignInPage(),
    '/sign-in' : (context) => SignInPage(),
    '/home'  : (context) => HomeScreen(),
    '/sign-out'  : (context) => const SignOut()
  };
}
