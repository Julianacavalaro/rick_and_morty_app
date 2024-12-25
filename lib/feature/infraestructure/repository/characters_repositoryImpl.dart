
import 'package:rick_and_morty_app/feature/domain/entity/character_entity.dart';
import 'package:rick_and_morty_app/feature/infraestructure/datasources/get_characters_datasource.dart';

import '../../domain/repository/characters_repository.dart';
import '../model/character_model.dart';

 class CharactersRepositoryImpl implements CharactersRepository  {   
    final GetCharactersDatasource datasource;

  CharactersRepositoryImpl({required this.datasource});
List<CharacterModel> list =[];

  @override
  Future<List<CharacterEntity>> getCharacters() async {

        try{
list = await datasource. getCharacters();
    }catch(e){

    }
    throw UnimplementedError();
  }

}
