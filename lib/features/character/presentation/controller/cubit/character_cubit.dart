// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_management_learn/features/character/data/models/character_model.dart';
import 'package:state_management_learn/features/character/domain/repository/charcater_repository.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;

  CharacterCubit(
    this.characterRepository,
  ) : super(CharacterLoadingState());

  Future<void> getCharacters() async {
    emit(CharacterLoadingState());
    Future.delayed(Duration(seconds: 10));
    try {
      final List<CharacterModel> characters =
          await characterRepository.getCharacters();
      emit(CharacterSuccesState(characters: characters));
    } catch (e) {
      emit(CharacterFailureState(error: e.toString()));
    }
  }
}
