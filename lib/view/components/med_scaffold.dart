// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MedScaffold extends StatelessWidget {
  final title;
  final silverList;
  final fab;
  bool backButton;
  MedScaffold(
      {super.key,
      required this.title,
      required this.silverList,
      this.fab,
      this.backButton = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: (fab != null)
          ? FloatingActionButton.extended(
              onPressed: fab,
              icon: const Icon(Icons.add),
              label: const Text("Add"),
            )
          : const SizedBox(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            leading: (backButton)
                ? const BackButton(color: Colors.white)
                : const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2,
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
          ),
          if (silverList != null) ...[silverList]
        ],
      ),
    );
  }
}
