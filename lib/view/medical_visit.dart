import 'package:flutter/material.dart';
import 'package:medrecords/view/components/med_scaffold.dart';

class MedicalVisitPage extends StatelessWidget {
  const MedicalVisitPage({super.key});
  static const route = 'medical_records';
  @override
  Widget build(BuildContext context) {
    return MedScaffold(
      title: "Medical Visits",
      fab: () {},
      silverList: null,
    );
  }
}
