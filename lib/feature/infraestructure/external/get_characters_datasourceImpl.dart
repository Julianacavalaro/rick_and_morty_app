import 'dart:convert';

import 'package:http/http.dart';

import '../datasources/get_characters_datasource.dart';
import '../model/character_model.dart';

/* abstract class HttpClient {
  Future get({required  String url});
}
*/

class GetCharactersDatasourceImpl implements GetCharactersDatasource {
  final client = Client();

  @override
  Future<List<CharacterModel>> getCharacters() async {
    const String url = "https://rickandmortyapi.com/api/character";

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<CharacterModel> characters = [];

      final body = json.decode(response.body);

      body['characters'].map((item) {
        final CharacterModel character = CharacterModel.fromJson(item);
        characters.add(character);
      }).toList();

      return characters;
    } else {
      throw Exception('DataSource Error');
    }
  }
}
