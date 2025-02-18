import 'package:blue_meth_registery/core/presentation/components/CharacterCard.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Breaking",
              style: TextStyle(
                fontSize: 36,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' Bad',
              style: TextStyle(
                fontSize: 36,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: GridView.count(
        childAspectRatio:0.6 ,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
        children: List.generate(10, (index) {
          return CharacterCard();
        }),
      ),
    );
  }
}
