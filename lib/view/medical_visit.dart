// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medrecords/config/const.dart';
import 'package:medrecords/database/database_services.dart';
import 'package:medrecords/main.dart';
import 'package:medrecords/view/components/med_scaffold.dart';
import 'package:medrecords/view/components/widgets.dart';
import 'package:medrecords/view/components/widgets/cards.dart';

import 'components/widgets/app_button.dart';

class MedicalVisitPage extends StatefulWidget {
  const MedicalVisitPage({super.key});
  static const route = 'medical_records';

  @override
  State<MedicalVisitPage> createState() => _MedicalVisitPageState();
}

class _MedicalVisitPageState extends State<MedicalVisitPage> {
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  String doctorName = "";
  String dateTime = "";
  String purpose = "";
  String place = "";
  String uid = prefs.getString('USERID') ?? "";
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MedScaffold(
      title: "Medical Visits",
      fab: () {
        addMedicalVisit(context, size);
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
                      .collection('medicalvisits')
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
                            return MedicalVistiCard(
                              drName: data[index]['doctorName'],
                              dateTime: data[index]['dateTime'],
                              purpose: data[index]['purpose'],
                              place: data[index]['place'],
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

  Future<dynamic> addMedicalVisit(BuildContext context, Size size) {
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
                  "Add New Medial visit",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.darkGray,
                  ),
                ),
                const Divider(),
                inputFeild(
                    hinttxt: "Doctor Name",
                    icon: Icons.person,
                    color: AppColor.darkGray,
                    fieldcontroller: doctorNameController,
                    onChanged: (value) {
                      setState(() {
                        doctorName = value;
                      });
                    }),
                inputFeild(
                    hinttxt: "Purpose of visiting",
                    icon: Icons.all_inclusive,
                    color: AppColor.darkGray,
                    fieldcontroller: purposeController,
                    onChanged: (value) {
                      setState(() {
                        purpose = value;
                      });
                    }),
                inputFeild(
                    hinttxt: "Date & Time",
                    icon: Icons.date_range,
                    color: AppColor.darkGray,
                    fieldcontroller: dateTimeController,
                    onChanged: (value) {
                      dateTime = value;
                    }),
                inputFeild(
                    hinttxt: "Place",
                    icon: Icons.location_city,
                    color: AppColor.darkGray,
                    fieldcontroller: placeController,
                    onChanged: (value) {
                      place = value;
                    }),
                AppButton(
                    txt: "Add",
                    onTap: () async {
                      log("Button Tapped");
                      var dbServices = DatabaseServices();
                      await dbServices
                          .createMedicalvisits(
                              doctorName, purpose, dateTime, place)
                          .then((value) {
                        if (value == true) {
                          Navigator.pop(context);
                          doctorNameController.text = "";
                          dateTimeController.text = "";
                          purposeController.text = "";
                          placeController.text = "";
                        }
                      });
                    })
              ]),
            ),
          );
        });
  }
}
