import 'package:flutter/material.dart';
import 'package:medrecords/config/const.dart';

class PrimaryCard extends StatelessWidget {
  final String title;
  final List<Widget> subtitles;
  const PrimaryCard({super.key, required this.title, required this.subtitles});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      color: AppColor.lightSeaBlue,
      child: SizedBox(
        width: size.width,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8.0),
          child: Row(
            children: [
              const Icon(
                Icons.medical_information,
                color: AppColor.darkGray,
                size: 50,
              ),
              const SizedBox(
                width: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: AppColor.darkGray,
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                  for (var each in subtitles) ...[each]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicalVistiCard extends StatelessWidget {
  final String drName;
  final String dateTime;
  const MedicalVistiCard(
      {super.key, required this.drName, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(title: drName, subtitles: <Widget>[
      Text(
        dateTime,
        style: const TextStyle(
            color: AppColor.darkGray,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
    ]);
  }
}
