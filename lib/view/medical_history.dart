import 'package:flutter/material.dart';
import 'package:medrecords/view/components/med_scaffold.dart';

class MedicalHistoryPage extends StatelessWidget {
  const MedicalHistoryPage({super.key});
  static const route = 'medical_history';
  @override
  Widget build(BuildContext context) {
    return MedScaffold(
      title: "Medical History",
      fab: () {},
      silverList: null,
    );
  }
}
