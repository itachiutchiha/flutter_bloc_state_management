import 'package:state_management_learn/features/character/data/models/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getCharacters();
}
