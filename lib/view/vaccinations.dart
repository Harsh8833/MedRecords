import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medrecords/view/components/med_scaffold.dart';
import 'package:medrecords/view/components/widgets/app_button.dart';

import '../config/const.dart';
import 'components/widgets.dart';

class VaccinationPage extends StatelessWidget {
  const VaccinationPage({super.key});
  static const route = 'vacci';

  @override
  Widget build(BuildContext context) {
    return MedScaffold(
      title: "Vaccinations",
      fab: () {
        addVaccination(context);
      },
      silverList: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return SizedBox(
            height: 100,
          );
        }, childCount: 1),
      ),
    );
  }

  Future<dynamic> addVaccination(BuildContext context) {
    final TextEditingController vacciNameController = TextEditingController();
    final TextEditingController vacciDateController = TextEditingController();
    final TextEditingController vacciExpController = TextEditingController();

    String vacciName = "";
    String vacciDate = "";
    String vacciExp = "";
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
                    hinttxt: "Name of Vaccination",
                    icon: Icons.vaccines,
                    fieldcontroller: vacciNameController,
                    onChanged: (value) {
                      vacciName = value;
                    }),
                inputFeild(
                    hinttxt: "Date of Vaccination",
                    icon: Icons.date_range,
                    fieldcontroller: vacciDateController,
                    onChanged: (value) {
                      vacciDate = value;
                    }),
                inputFeild(
                    hinttxt: "Vaccination Validity",
                    icon: Icons.access_time,
                    fieldcontroller: vacciExpController,
                    onChanged: (value) {
                      vacciExp = value;
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
