import '../../domain/entity/characters_model.dart';

abstract class GetCharactersDatasource{
    Future<List<CharacterModel>> getCharacters();
}