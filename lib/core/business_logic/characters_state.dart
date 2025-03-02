part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {
  final List<Character>? characters;
  const CharactersState(this.characters);
}

final class CharacterLoading extends CharactersState{
  const CharacterLoading():super(null);
}
final class Error extends CharactersState{
  final String error;
 const Error(this.error):super(null);
}
final class CharacterLoaded extends CharactersState{
 const CharacterLoaded(super.characters);
}