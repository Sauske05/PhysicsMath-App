import 'package:flutter/material.dart';
import 'map_of_pastpapers.dart';
import './Physics_ListTile_module.dart';

class PhysicsPastPaper extends StatelessWidget {
  const PhysicsPastPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          var year = Map.Physicspastpapers[index]['Year'];
          var month = Map.Physicspastpapers[index]['Month'];
          List<String> contentMap =
              Map.Physicspastpapers[index]['Title'] as List<String>;
          return PhysicsListTile(
            contentMap,
            month.toString(),
            year.toString(),
          );
        }),
        itemCount: Map.Physicspastpapers.length,
      ),
    );
  }
}
