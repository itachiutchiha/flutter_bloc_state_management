// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_cubit.dart';

abstract class CharacterState extends Equatable {}

class CharacterLoadingState extends CharacterState {
  @override
  List<Object?> get props => [];
}

class CharacterSuccesState extends CharacterState {
  final List<CharacterModel> characters;
  CharacterSuccesState({
    required this.characters,
  });

  @override
  List<Object?> get props => [characters];
}

class CharacterFailureState extends CharacterState {
  final String error;
  CharacterFailureState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
