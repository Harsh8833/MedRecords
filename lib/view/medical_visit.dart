import 'package:flutter/material.dart';
import 'package:medrecords/config/const.dart';
import 'package:medrecords/view/components/med_scaffold.dart';
import 'package:medrecords/view/components/widgets.dart';
import 'package:medrecords/view/components/widgets/cards.dart';

import 'components/widgets/app_button.dart';

class MedicalVisitPage extends StatelessWidget {
  MedicalVisitPage({super.key});
  static const route = 'medical_records';
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
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
                child: Column(
                  children: [
                    const MedicalVistiCard(
                      drName: "Dr.SomeOne",
                      dateTime: "10/12/2022 10:30 am",
                    )
                  ],
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
            child: SizedBox(
                height: size.height * 0.45,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(children: [
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
                          doctorNameController.text = value;
                        }),
                    inputFeild(
                        hinttxt: "Purpose of visiting",
                        icon: Icons.all_inclusive,
                        fieldcontroller: purposeController,
                        onChanged: (value) {
                          purposeController.text = value;
                        }),
                    inputFeild(
                        hinttxt: "Date & Time",
                        icon: Icons.date_range,
                        fieldcontroller: dateTimeController,
                        onChanged: (value) {
                          dateTimeController.text = value;
                        }),
                    inputFeild(
                        hinttxt: "Palce",
                        icon: Icons.location_city,
                        fieldcontroller: placeController,
                        onChanged: (value) {
                          placeController.text = value;
                        }),
                    AppButton(
                        txt: "Add",
                        onTap: () {
                          print(doctorNameController.text +
                              purposeController.text +
                              dateTimeController.text +
                              placeController.text);
                        })
                  ]),
                )),
          );
        });
  }
}
