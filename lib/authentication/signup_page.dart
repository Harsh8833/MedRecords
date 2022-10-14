import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medrecords/authentication/authservices.dart';
import 'package:medrecords/authentication/login_page.dart';
import 'package:medrecords/view/components/widgets.dart';
import 'package:medrecords/view/homepage.dart';

import '../view/components/widgets/app_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static const route = 'signup_page';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String fullName = "";
  String email = "";
  String password = "";
  AuthServices authService = AuthServices();

  Future signUp() async {
    showLoading(context);
    await authService
        .registerUserWithEmailandPassword(fullName, email, password)
        .then((value) async {
      if (value == true) {
        await HelperFunction.saveUserLoggedInStatus(true);
        await HelperFunction.saveUserEmailSF(email);
        await HelperFunction.saveUserNameSF(fullName);

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Homepage()),
            (route) => false);
      } else {
        showSnackBar(context, Colors.red, value);
      }
    });
  }

  showLoading(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Please wait")
                ],
              ),
            ),
          );
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
                  "New\nAccount",
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
                    hinttxt: "Name",
                    icon: CupertinoIcons.profile_circled,
                    fieldcontroller: _nameController,
                    onChanged: (value) {
                      setState(() {
                        fullName = value;
                      });
                    },
                    obscuretext: false)),
            const SizedBox(
              height: 25,
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
                    txt: "Sign up",
                    onTap: () {
                      signUp();
                    })),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not the first time here?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextButton(
                    onPressed: (() {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginPage.route, (route) => false);
                    }),
                    child: const Text(
                      "Log In",
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
