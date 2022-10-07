import 'package:flutter/material.dart';
import 'package:medrecords/view/components/med_scaffold.dart';

class AllergiesPage extends StatelessWidget {
  const AllergiesPage({super.key});
  static const route = 'allergies';
  @override
  Widget build(BuildContext context) {
    return MedScaffold(
      title: "Allergics",
      fab: () {},
      silverList: null,
    );
    ;
  }
}
