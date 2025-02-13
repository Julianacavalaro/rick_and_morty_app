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
       bool isLoading = true;
  @override
  Future<List<CharacterEntity>> getAllCharacters() async {
    final List<CharacterEntity> list;

    try {
 
      list = await usecase.getAllCharacters();
        isLoading = false;
    } catch (e) {
      throw Exception();
    }
    return list;
  }

  @override
  Color getColor(String status) {
    if (status == 'Alive') {
      return const Color.fromARGB(255, 56, 137, 59);
    } else if (status == 'unknown') {
      return const Color.fromARGB(255, 131, 79, 19);
    } else {
      return const Color.fromARGB(255, 0, 0, 0);
    }
  }
}
