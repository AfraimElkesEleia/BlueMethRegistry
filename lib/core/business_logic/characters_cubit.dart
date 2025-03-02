import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../data/models/character.dart';
import '../data/repository/caharacter_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository ;
  CharactersCubit(this.charactersRepository) : super(CharacterLoading());
  void getAllCharacter(){
    emit(CharacterLoading());
    try {
      charactersRepository.getAllCharacters().then((characters) {
        emit(CharacterLoaded(characters));
      });
    }catch(e){
      emit(Error(e.toString()));
    }
  }
}
