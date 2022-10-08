import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medrecords/config/const.dart';
import 'package:medrecords/view/components/med_scaffold.dart';
import 'package:medrecords/view/components/widgets.dart';
import 'package:medrecords/view/components/widgets/app_button.dart';

class AllergiesPage extends StatelessWidget {
  static const route = 'allergies';
  const AllergiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MedScaffold(
      title: "Allergies",
      fab: () {
        addAllergies(context);
      },
      silverList: null,
    );
  }

  Future<dynamic> addAllergies(BuildContext context) {
    final TextEditingController allergyNameController = TextEditingController();
    final TextEditingController allergyDurationController =
        TextEditingController();
    final TextEditingController precautionsController = TextEditingController();

    String allergyName = "";
    String allergyDuration = "";
    String precautions = "";
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "New Allergies",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.darkGray,
                  ),
                ),
                const Divider(),
                inputFeild(
                    hinttxt: "Name of Allergy",
                    icon: Icons.coronavirus,
                    fieldcontroller: allergyNameController,
                    onChanged: (value) {
                      allergyName = value;
                    }),
                inputFeild(
                    hinttxt: "Duration of Allergy",
                    icon: Icons.lock_clock,
                    fieldcontroller: allergyDurationController,
                    onChanged: (value) {
                      allergyDuration = value;
                    }),
                inputFeild(
                    hinttxt: "Precautions",
                    icon: Icons.health_and_safety,
                    fieldcontroller: precautionsController,
                    onChanged: (value) {
                      precautions = value;
                    }),
                AppButton(
                    txt: "Add",
                    onTap: () {
                      log("Button Tapped");
                    })
              ]),
            ),
          );
        });
  }
}
