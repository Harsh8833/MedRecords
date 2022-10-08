import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medrecords/authentication/authservices.dart';
import 'package:medrecords/authentication/welcome_page.dart';
import 'package:medrecords/view/allergies.dart';
import 'package:medrecords/view/components/med_scaffold.dart';
import 'package:medrecords/view/medical_history.dart';
import 'package:medrecords/view/medical_visit.dart';
import 'package:medrecords/view/vaccinations.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static const route = 'home';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MedScaffold(
      title: "MedRecords",
      backButton: false,
      fab: () {
        log("Logout Started");
        AuthServices().signOut().then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, WelcomePage.route, (route) => false));
      },
      silverList: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SizedBox(
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 64.0,
                ),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  semanticChildCount: 2,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12),
                  children: [
                    mainButtons(
                        context, "Medical\nHistory", MedicalHistoryPage.route),
                    mainButtons(
                        context, "Medical\nVisits", MedicalVisitPage.route),
                    mainButtons(context, "Allergies", AllergiesPage.route),
                    mainButtons(context, "Vaccinations", VaccinationPage.route),
                  ],
                ),
              ),
            );
          },
          childCount: 1,
        ),
      ),
    );
  }

  MaterialButton mainButtons(context, txt, route) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Text(
        txt,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
