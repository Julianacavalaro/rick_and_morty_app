import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/feature/myapp/domain/usecase/get_all_characters_usecase.dart';
import 'package:rick_and_morty_app/feature/myapp/infraestructure/external/get_characters_datasourceImpl.dart';
import 'package:rick_and_morty_app/feature/myapp/infraestructure/repository/characters_repositoryImpl.dart';

import '../../../presenter/pages/character_page.dart';

class HomePageController extends ChangeNotifier{
  final GetAllCharactersUsecase usecase = GetAllCharactersUsecaseImpl(repository: CharactersRepositoryImpl(datasource: GetCharactersDatasourceImpl()));

  List<CharacterPageArg> characters = [];
bool isLoading = true;

  homeController() {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    var dados = await usecase.getAllCharacters();
    characters = dados
        .map((char) => CharacterPageArg(
              name: char.name,
              image: char.image,
              status: char.status,
            ))
        .toList();
    isLoading = false;
    notifyListeners();
  }
  

  }