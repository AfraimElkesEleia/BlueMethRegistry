import 'package:flutter/material.dart';

import '../components/character_card.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio:0.6 ,
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      crossAxisSpacing: 5,
      mainAxisSpacing: 10,
      children: List.generate(10, (index) {
        return CharacterCard();
      }),
    );
  }
}
