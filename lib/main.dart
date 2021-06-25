import 'package:flutter/material.dart';
import '/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase/navigate.dart';
import 'firebase/sign_in_page.dart';

// void main() => runApp(
//
//
//       MyApp(),
//     );
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: Navigate.routes,

      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        // ignore: deprecated_member_use
        accentColor: const Color(0xFFD8ECF1),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
      ),

    );
  }
}
