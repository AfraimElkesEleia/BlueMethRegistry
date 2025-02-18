import 'package:blue_meth_registery/core/presentation/components/character_card.dart';
import 'package:blue_meth_registery/core/presentation/screens/character_screen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
      body: CharactersScreen()
    );
  }
}
