import 'package:flutter/material.dart';
import 'package:medrecords/view/components/med_scaffold.dart';
import 'package:medrecords/view/components/widgets/cards.dart';

class MedicalVisitPage extends StatelessWidget {
  const MedicalVisitPage({super.key});
  static const route = 'medical_records';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MedScaffold(
      title: "Medical Visits",
      fab: () {},
      silverList: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SizedBox(
                height: size.height,
                child: Column(
                  children: [
                    MedicalVistiCard(
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
}
