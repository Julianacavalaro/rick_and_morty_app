import 'dart:ui';

import 'package:rick_and_morty_app/feature/myapp/domain/entity/character_entity.dart';
import 'package:rick_and_morty_app/feature/myapp/domain/usecase/get_all_characters_usecase.dart';

abstract class GetAllCharactersController {
  Future<List<CharacterEntity>> getAllCharacters();
  Color getColor(String status);
}

class GetAllCharactersControllerImpl extends GetAllCharactersController {
  final GetAllCharactersUsecase usecase;
  


  GetAllCharactersControllerImpl({required this.usecase});


  @override
  Future<List<CharacterEntity>> getAllCharacters() async {
      final List<CharacterEntity> list;

    try {
      list = await usecase.getAllCharacters();
    } catch (e) {
      throw Exception();
    }
    return list;
  }
  
  @override
  Color getColor(String status) {
  if(status == 'Alive'){
    return Color.fromARGB(255, 56, 137, 59);
  } else if (status == 'unknown'){
   return Color.fromARGB(255, 131, 79, 19);
  }
  else
  return Color.fromARGB(255, 0, 0, 0);
  }
}
