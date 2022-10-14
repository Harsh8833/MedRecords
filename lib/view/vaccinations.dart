// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medrecords/view/components/med_scaffold.dart';
import 'package:medrecords/view/components/widgets/app_button.dart';
import 'package:medrecords/view/components/widgets/cards.dart';

import '../config/const.dart';
import '../database/database_services.dart';
import '../main.dart';
import 'components/widgets.dart';

class VaccinationPage extends StatefulWidget {
  const VaccinationPage({super.key});
  static const route = 'vacci';

  @override
  State<VaccinationPage> createState() => _VaccinationPageState();
}

class _VaccinationPageState extends State<VaccinationPage> {
  String uid = prefs.getString('USERID') ?? "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MedScaffold(
      title: "Vaccinations",
      fab: () {
        addVaccination(context);
      },
      silverList: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SizedBox(
                height: size.height,
                child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("users")
                      .doc(uid)
                      .collection('vaccinations')
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        var data = snapshot.data!.docs;
                        print(data.length);
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return VaccinationCard(
                              vacciName: data[index]['vacciName'],
                              vacciDate: data[index]['vacciDate'],
                              vacciExp: data[index]['vacciExp'],
                            );
                          },
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text('State: ${snapshot.connectionState}');
                    }
                  },
                ));
          },
          childCount: 1,
        ),
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
                    color: AppColor.darkGray,
                    fieldcontroller: vacciNameController,
                    onChanged: (value) {
                      vacciName = value;
                    }),
                inputFeild(
                    hinttxt: "Date of Vaccination",
                    icon: Icons.date_range,
                    color: AppColor.darkGray,
                    fieldcontroller: vacciDateController,
                    onChanged: (value) {
                      vacciDate = value;
                    }),
                inputFeild(
                    hinttxt: "Vaccination Validity",
                    icon: Icons.access_time,
                    color: AppColor.darkGray,
                    fieldcontroller: vacciExpController,
                    onChanged: (value) {
                      vacciExp = value;
                    }),
                AppButton(
                    txt: "Add",
                    onTap: () async {
                      log("Button Tapped");
                      var dbServices = DatabaseServices();
                      await dbServices
                          .createVaccinations(vacciName, vacciDate, vacciExp)
                          .then((value) {
                        Navigator.pop(context);
                        vacciName = "";
                        vacciDate = "";
                        vacciExp = "";
                      });
                    })
              ]),
            ),
          );
        });
  }
}
