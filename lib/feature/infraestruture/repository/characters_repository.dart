
import 'dart:convert';

import '../../domain/model/characters_model.dart';
import '../../external/http/http_client.dart';

abstract class CharactersRepository {

  Future<List<CharactersModel>> getCharacters();
}

class CharactersRepositoryImpl implements CharactersRepository {
      final HttpClient httpClient;
   final String url = "https://rickandmortyapi.com/api/character";

  CharactersRepositoryImpl({required this.httpClient});
  
  @override
  Future<List<CharactersModel>> getCharacters() async {
 final response = await  httpClient.get(url: url);
 if(response.status == 200){
  final List<CharactersModel> characters =[];

final body = jsonDecode(response.body);

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
