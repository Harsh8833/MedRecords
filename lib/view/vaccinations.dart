import 'package:flutter/material.dart';
import 'package:medrecords/view/components/med_scaffold.dart';

class VaccinationPage extends StatelessWidget {
  const VaccinationPage({super.key});
  static const route = 'vacci';

  @override
  Widget build(BuildContext context) {
    return MedScaffold(
      title: "Vaccinations",
      fab: () {},
      silverList: null,
    );
  }
}
