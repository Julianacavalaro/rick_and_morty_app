import '../../domain/model/characters_model.dart';

abstract class GetCharactersDatasource{
    Future<List<CharactersModel>> getCharacters();
}