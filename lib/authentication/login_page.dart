import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medrecords/authentication/signup_page.dart';
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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
            child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
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
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Log In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                width: 300,
                child: loginsignupfields("Mail", CupertinoIcons.mail)),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                width: 300,
                child: loginsignupfields("Password", CupertinoIcons.lock)),
            const SizedBox(
              height: 45,
            ),
            SizedBox(
                width: 220,
                child: loginsignupButtons(
                    context, "L O G I N", Homepage.route, Colors.blueGrey)),
            const SizedBox(
              height: 5,
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
                    onPressed: (() {
                      SignupPage.route;
                    }),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white70),
                    ))
              ],
            )
          ],
        )),
      ),
    );
  }
}
