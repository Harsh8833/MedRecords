import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medrecords/config/const.dart';
import 'package:medrecords/database/database_services.dart';
import 'package:medrecords/view/components/med_scaffold.dart';
import 'package:medrecords/view/components/widgets.dart';
import 'package:medrecords/view/components/widgets/app_button.dart';
import 'package:medrecords/view/components/widgets/cards.dart';

import '../main.dart';

class AllergiesPage extends StatefulWidget {
  static const route = 'allergies';
  const AllergiesPage({super.key});

  @override
  State<AllergiesPage> createState() => _AllergiesPageState();
}

class _AllergiesPageState extends State<AllergiesPage> {
  String uid = prefs.getString('USERID') ?? "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MedScaffold(
      title: "Allergies",
      fab: () {
        addAllergies(context);
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
                      .collection('allergies')
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
                        // ignore: avoid_print
                        print(data.length);
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AllergiesCard(
                              allergyName: data[index]['allergyName'],
                              duration: data[index]['allergyDuration'],
                              precautions: data[index]['precautions'],
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
                    color: AppColor.darkGray,
                    onChanged: (value) {
                      allergyName = value;
                    }),
                inputFeild(
                    hinttxt: "Duration of Allergy",
                    icon: Icons.lock_clock,
                    fieldcontroller: allergyDurationController,
                    color: AppColor.darkGray,
                    onChanged: (value) {
                      allergyDuration = value;
                    }),
                inputFeild(
                    hinttxt: "Precautions",
                    icon: Icons.health_and_safety,
                    color: AppColor.darkGray,
                    fieldcontroller: precautionsController,
                    onChanged: (value) {
                      precautions = value;
                    }),
                AppButton(
                    txt: "Add",
                    onTap: () async {
                      log("Button Tapped");
                      var dbServices = DatabaseServices();
                      await dbServices
                          .createAllergies(
                              allergyName, allergyDuration, precautions)
                          .then((value) {
                        Navigator.pop(context);
                        allergyName = "";
                        allergyDuration = "";
                        precautions = "";
                      });
                    })
              ]),
            ),
          );
        });
  }
}
