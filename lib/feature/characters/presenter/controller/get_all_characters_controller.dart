import 'package:rick_and_morty_app/feature/characters/domain/entity/character_entity.dart';

abstract class GetAllCharactersController {
  Future<List<CharacterEntity>> getAllCharacters();
}
class GetAllCharactersControllerImpl extends GetAllCharactersController{
  @override
  Future<List<CharacterEntity>> getAllCharacters() {
    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }

}