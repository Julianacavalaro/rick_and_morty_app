
import 'dart:convert';

import 'package:http/http.dart';
import 'package:rick_and_morty_app/feature/domain/model/characters_model.dart';

import '../datasources/get_characters_datasource.dart';

/* abstract class HttpClient {
  Future get({required  String url});
}
*/

class GetCharactersDatasourceImpl implements GetCharactersDatasource {
  final client = Client();

  @override
  Future<List<CharactersModel>> getCharacters() async {
   final String url = "https://rickandmortyapi.com/api/character";

    // TODO: implement getCharacters
  //  final cliente = Client();
   final response = await client.get(Uri.parse(url));

 if(response.statusCode == 200){
  final List<CharactersModel> characters =[];

final body = json.decode(response.body);

body['characters'].map((item) { 
  final CharactersModel character = CharactersModel.fromJson(item);
  characters.add(character);
}).toList();

  return  characters;
 }
 else {
    final List<CharactersModel> characters =[];

  return characters ;

 }
  }

}