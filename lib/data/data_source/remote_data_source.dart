import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:state_management_learn/core/constants/api_constants.dart';
import 'package:state_management_learn/data/models/character_model.dart';

class RemoteDataSource {
  Future<List<CharacterModel>> getCharacters() async {
    try {
      final Uri url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.productsEndpoint);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        final List<CharacterModel> characters =
            data.map((e) => CharacterModel.fromJson(e)).toList();
        return characters;
      }
    } catch (e) {
      throw Exception("Error happend while getting the charcaters data");
    }

    return [];
  }
}
