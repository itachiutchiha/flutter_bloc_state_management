// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:state_management_learn/features/character/data/data_source/remote_data_source.dart';
import 'package:state_management_learn/features/character/data/models/character_model.dart';
import 'package:state_management_learn/features/character/domain/repository/charcater_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  RemoteDataSource remoteDataSource;
  CharacterRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<CharacterModel>> getCharacters() async {
    try {
      final List<CharacterModel> characters =
          await remoteDataSource.getCharacters();
      return characters;
    } catch (e) {
      rethrow;
    }
  }
}
