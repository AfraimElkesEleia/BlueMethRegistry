import 'package:blue_meth_registery/core/data/models/character.dart';
import 'package:blue_meth_registery/core/data/web_services/character_web_service.dart';


class CharactersRepository {
  final CharacterWebServices characterWebServices;

  CharactersRepository(this.characterWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacter();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
