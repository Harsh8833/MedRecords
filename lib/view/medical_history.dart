import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medrecords/database/database_services.dart';
import 'package:medrecords/main.dart';
import 'package:medrecords/view/components/med_scaffold.dart';
import 'package:medrecords/view/components/widgets/app_button.dart';
import 'package:medrecords/view/components/widgets/cards.dart';

import '../config/const.dart';
import 'components/widgets.dart';

class MedicalHistoryPage extends StatefulWidget {
  const MedicalHistoryPage({super.key});

  static const route = 'medical_history';

  @override
  State<MedicalHistoryPage> createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  @override
  Widget build(BuildContext context) {
    String uid = prefs.getString('USERID') ?? "";
    final size = MediaQuery.of(context).size;
    return MedScaffold(
      title: "Medical History",
      fab: () {
        addMedicalHistory(context);
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
                      .collection('medicalHistory')
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
                              allergyName: data[index]['patientName'],
                              duration: data[index]['date'],
                              precautions: data[index]['reason'],
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

  Future<dynamic> addMedicalHistory(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController reasonController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    String name = "";
    String reason = "";
    String date = "";
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
                  "Add Medical History",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.darkGray,
                  ),
                ),
                const Divider(),
                MaterialButton(
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  // height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.photo,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Add/Capture Photo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                inputFeild(
                    hinttxt: "Name",
                    icon: Icons.person,
                    fieldcontroller: nameController,
                    color: AppColor.darkGray,
                    onChanged: (value) {
                      name = value;
                    }),
                inputFeild(
                    hinttxt: "Reason",
                    icon: Icons.book,
                    fieldcontroller: reasonController,
                    color: AppColor.darkGray,
                    onChanged: (value) {
                      reason = value;
                    }),
                inputFeild(
                    hinttxt: "Date",
                    icon: Icons.date_range,
                    color: AppColor.darkGray,
                    fieldcontroller: dateController,
                    onChanged: (value) {
                      date = value;
                    }),
                AppButton(
                    txt: "Add",
                    onTap: () async {
                      log("Button Tapped");
                      var dbServices = DatabaseServices();
                      await dbServices
                          .createMedicalHistory(name, reason, date)
                          .then((value) {
                        Navigator.pop(context);
                        name = "";
                        reason = "";
                        date = "";
                      });
                    })
              ]),
            ),
          );
        });
  }
}
