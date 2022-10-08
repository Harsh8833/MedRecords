import 'package:flutter/material.dart';

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
    final size = MediaQuery.of(context).size;
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
