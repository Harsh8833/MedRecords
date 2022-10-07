import 'package:flutter/material.dart';

class MedScaffold extends StatelessWidget {
  final title;
  final silverList;
  final fab;
  const MedScaffold(
      {super.key, required this.title, required this.silverList, this.fab});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: (fab != null)
          ? FloatingActionButton.extended(
              onPressed: fab,
              icon: Icon(Icons.add),
              label: Text("Add"),
            )
          : SizedBox(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
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
