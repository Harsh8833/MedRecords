import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                width: 250,
                child: loginsignupButtons(context, "Log In", route)),
          ),
          const SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
              ),
              TextButton(
                  onPressed: (() {}),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold, color: Colors.amber),
                  ))
            ],
          )
        ],
      ),
    );
  }

  MaterialButton loginsignupButtons(context, txt, route) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      color: Colors.amber,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Text(
        txt,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontFamily: GoogleFonts.poppins().fontFamily),
      ),
    );
  }
}
