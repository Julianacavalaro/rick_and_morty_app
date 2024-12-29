import 'package:rick_and_morty_app/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty_app/feature/characters/domain/usecase/get_all_characters_usecase.dart';

abstract class GetAllCharactersController {
  Future<List<CharacterEntity>> getAllCharacters();
}

class GetAllCharactersControllerImpl extends GetAllCharactersController {
  final GetAllCharactersUsecase usecase;

  List<CharacterEntity> list;

  GetAllCharactersControllerImpl({required this.usecase, required this.list});
  @override
  Future<List<CharacterEntity>> getAllCharacters() async {
    try {
      list = await usecase.getAllCharacters();
    } catch (e) {
      throw Exception();
    }
    return list;
  }
}
