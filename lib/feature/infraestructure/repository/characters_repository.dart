
import 'dart:convert';

import '../../domain/model/characters_model.dart';

abstract class CharactersRepository {

  Future<List<CharactersModel>> getCharacters();
}
