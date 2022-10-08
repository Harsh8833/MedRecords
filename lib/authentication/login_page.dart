import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medrecords/authentication/authservices.dart';
import 'package:medrecords/authentication/signup_page.dart';
import 'package:medrecords/view/components/widgets.dart';
import 'package:medrecords/view/homepage.dart';

import '../database/database_services.dart';
import '../view/components/widgets/app_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const route = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthServices authService = AuthServices();
  String email = "";
  String password = "";

  Future logIn() async {
    await authService
        .signInWithEmailandPassword(email, password)
        .then((value) async {
      if (value == true) {
        QuerySnapshot snapshot =
            await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
                .gettingUserData(email);
        await HelperFunction.saveUserLoggedInStatus(true);
        await HelperFunction.saveUserEmailSF(email);
        await HelperFunction.saveUserNameSF(snapshot.docs[0]['fullName']);

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Homepage()),
            (route) => false);
      }
    });
  }

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
                child: inputFeild(
                    hinttxt: "Mail",
                    icon: CupertinoIcons.mail,
                    fieldcontroller: _emailController,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    obscuretext: false)),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                width: 300,
                child: inputFeild(
                    hinttxt: "Password",
                    icon: CupertinoIcons.lock,
                    fieldcontroller: _passwordController,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscuretext: true)),
            const SizedBox(
              height: 45,
            ),
            SizedBox(
                width: 220,
                child: AppButton(
                    txt: "L O G I N",
                    onTap: () {
                      logIn();
                    })),
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
                      Navigator.pushNamedAndRemoveUntil(
                          context, SignupPage.route, (route) => false);
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
