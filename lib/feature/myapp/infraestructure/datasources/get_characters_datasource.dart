
import '../model/character_model.dart';

abstract class GetCharactersDatasource{
    Future<List<CharacterModel>> getCharacters();
}