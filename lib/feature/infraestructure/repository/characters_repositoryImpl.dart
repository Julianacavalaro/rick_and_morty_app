import 'package:rick_and_morty_app/feature/domain/entity/character_entity.dart';
import 'package:rick_and_morty_app/feature/infraestructure/datasources/get_characters_datasource.dart';

import '../../domain/repository/characters_repository.dart';
import '../model/character_model.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final GetCharactersDatasource datasource;

  CharactersRepositoryImpl({required this.datasource});

  @override
  Future<List<CharacterEntity>> getCharacters() async {
      final  List<CharacterModel> list;

    try {
      list = await datasource.getCharacters();
    } catch (e) {
      throw Exception();
    }
    return list;
  }
}
