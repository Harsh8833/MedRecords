import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medrecords/authentication/login_page.dart';
import 'package:medrecords/authentication/signup_page.dart';
import 'package:medrecords/authentication/welcome_page.dart';
import 'package:medrecords/config/theme.dart';
import 'package:medrecords/view/allergies.dart';
import 'package:medrecords/view/homepage.dart';
import 'package:medrecords/view/main_activity.dart';
import 'package:medrecords/view/medical_history.dart';
import 'package:medrecords/view/medical_visit.dart';
import 'package:medrecords/view/vaccinations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: Homepage.route,
      routes: {
        Homepage.route: (context) => const Homepage(),
        WelcomePage.route: ((context) => const WelcomePage()),
        LoginPage.route: (context) => const LoginPage(),
        SignupPage.route: (context) => const SignupPage(),
        MedicalHistoryPage.route: (context) => const MedicalHistoryPage(),
        MedicalVisitPage.route: ((context) => MedicalVisitPage()),
        AllergiesPage.route: (context) => const AllergiesPage(),
        VaccinationPage.route: ((context) => const VaccinationPage())
      },
    );
  }
}
