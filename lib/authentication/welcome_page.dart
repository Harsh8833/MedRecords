// ignore_for_file: unnecessary_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medrecords/authentication/login_page.dart';
import 'package:medrecords/authentication/signup_page.dart';

import '../view/components/widgets/app_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static const route = 'welcome_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: SizedBox(
                height: 150,
                child: Image.asset('assets/images/undraw_doctors_hwty.png')),
          ),
          const SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Start\nyour\nmedical records",
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
            ),
          ),
          const SizedBox(
            height: 260,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 68),
            child: SizedBox(
                width: 220,
                child: AppButton(
                  txt: "Log In",
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage.route);
                  },
                )),
          ),
          const SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
              TextButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, SignupPage.route);
                  }),
                  child: const Text(
                    "Sign Up Here",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
