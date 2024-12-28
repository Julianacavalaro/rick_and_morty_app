
import '../../infraestructure/model/character_model.dart';
import '../entity/character_entity.dart';

abstract class CharactersRepository{
    Future<List<CharacterEntity>>getCharacters();

}