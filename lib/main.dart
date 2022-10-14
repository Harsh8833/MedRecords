import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medrecords/authentication/login_page.dart';
import 'package:medrecords/authentication/signup_page.dart';
import 'package:medrecords/authentication/welcome_page.dart';
import 'package:medrecords/config/theme.dart';
import 'package:medrecords/view/allergies.dart';
import 'package:medrecords/view/homepage.dart';
import 'package:medrecords/view/medical_history.dart';
import 'package:medrecords/view/medical_visit.dart';
import 'package:medrecords/view/vaccinations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/authservices.dart';

late SharedPreferences prefs;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = true;
  // This widget is the root of your application.

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() {
    HelperFunction.getUserLoggedInStatus().then((value) {
      log(value.toString());
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedRecords',
      debugShowCheckedModeBanner: true,
      theme: AppTheme.lightTheme,
      home: _isSignedIn ? const Homepage() : const WelcomePage(),
      routes: {
        Homepage.route: (context) => const Homepage(),
        WelcomePage.route: ((context) => const WelcomePage()),
        LoginPage.route: (context) => const LoginPage(),
        SignupPage.route: (context) => const SignupPage(),
        MedicalHistoryPage.route: (context) => const MedicalHistoryPage(),
        MedicalVisitPage.route: ((context) => const MedicalVisitPage()),
        AllergiesPage.route: (context) => const AllergiesPage(),
        VaccinationPage.route: ((context) => const VaccinationPage())
      },
    );
  }
}
