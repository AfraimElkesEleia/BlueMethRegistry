import 'package:blue_meth_registery/core/business_logic/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/character.dart';
import '../components/character_card.dart';

class CharactersScreen extends StatelessWidget {
  final List<Character> allCharacters;
 const CharactersScreen({super.key , required this.allCharacters});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        return
          GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemCount: allCharacters.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
              return CharacterCard(character: allCharacters[index]);
          },
        );
      },
    );
  }
}
