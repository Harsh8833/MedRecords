import 'package:flutter/material.dart';
import 'package:medrecords/config/const.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 150,
              flexibleSpace: const FlexibleSpaceBar(
                expandedTitleScale: 2,
                title: Text(
                  'MedRecords',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    height: size.height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 64.0,
                      ),
                      child: GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        semanticChildCount: 2,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12),
                        children: [
                          mainButtons(context, "Medical History", () {}),
                          mainButtons(context, "Medical Visits", () {}),
                          mainButtons(context, "Allergies", () {}),
                          mainButtons(context, "Vaccinations", () {}),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),

        // body: Column(children: [
        //   const Text(
        //     "Medrecords",
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: SizedBox(
        //       height: size.height * 0.5,
        //       child: GridView(
        //         physics: const,
        //         semanticChildCount: 2,
        //         shrinkWrap: true,
        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
        //         children: [mainButtons("Button1"), mainButtons("Button1")],
        //       ),
        //     ),
        //   )
        // ]),
      ),
    );
  }

  MaterialButton mainButtons(context, txt, onTap) {
    return MaterialButton(
      onPressed: onTap,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Text(
        txt,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
