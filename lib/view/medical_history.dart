import 'package:flutter/material.dart';
import 'package:medrecords/view/components/med_scaffold.dart';

class MedicalHistoryPage extends StatelessWidget {
  const MedicalHistoryPage({super.key});

  static const route = 'medical_history';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MedScaffold(
      title: "Medical History",
      fab: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: SizedBox(
                    height: size.height * 0.4,
                    child: Column(children: const [
                      Text("Add New Medial Record"),
                    ])),
              );
            });
      },
      silverList: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SizedBox(
                height: size.height,
                child: Column(
                  children: const [],
                ));
          },
          childCount: 1,
        ),
      ),
    );
  }
}
