import 'package:flutter/material.dart';
import 'package:medrecords/view/components/med_scaffold.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MedScaffold(
      title: "Profile",
      silverList: null,
    );
  }
}
