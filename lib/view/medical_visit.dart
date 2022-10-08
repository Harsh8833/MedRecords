import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medrecords/config/const.dart';
import 'package:medrecords/database/database_services.dart';
import 'package:medrecords/view/components/med_scaffold.dart';
import 'package:medrecords/view/components/widgets.dart';
import 'package:medrecords/view/components/widgets/cards.dart';

import 'components/widgets/app_button.dart';

class MedicalVisitPage extends StatefulWidget {
  MedicalVisitPage({super.key});
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

  @override
  void initState() {
    var data = DatabaseServices().gettingMedicalvisits();
    log("=========DATA=========");
    print(data);
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
                  future: DatabaseServices().gettingMedicalvisits(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        var data = snapshot.data;
                        print(data..toString());
                        return Text("",
                            style: const TextStyle(
                                color: Colors.cyan, fontSize: 36));
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
                    fieldcontroller: doctorNameController,
                    onChanged: (value) {
                      setState(() {
                        doctorName = value;
                      });
                    }),
                inputFeild(
                    hinttxt: "Purpose of visiting",
                    icon: Icons.all_inclusive,
                    fieldcontroller: purposeController,
                    onChanged: (value) {
                      setState(() {
                        purpose = value;
                      });
                    }),
                inputFeild(
                    hinttxt: "Date & Time",
                    icon: Icons.date_range,
                    fieldcontroller: dateTimeController,
                    onChanged: (value) {
                      dateTime = value;
                    }),
                inputFeild(
                    hinttxt: "Place",
                    icon: Icons.location_city,
                    fieldcontroller: placeController,
                    onChanged: (value) {
                      place = value;
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
