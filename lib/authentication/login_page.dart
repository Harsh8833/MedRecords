import 'package:flutter/material.dart';
import 'package:medrecords/view/components/widgets.dart';
import 'package:medrecords/view/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const route = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 25,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Text(
              "Log In",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
              child: SizedBox(
                  width: 300, child: loginsignupfields("Mail", Icons.mail))),
          const SizedBox(height: 35),
          Center(
              child: SizedBox(
                  width: 300,
                  child: loginsignupfields("Password", Icons.lock))),
          const SizedBox(height: 50),
          SizedBox(
              width: 220,
              child: loginsignupButtons(
                  context, "L O G I N", Homepage.route, Colors.blueGrey)),
          const SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "First time here?",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              TextButton(
                  onPressed: (() {}),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white70),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
