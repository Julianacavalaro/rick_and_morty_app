import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/feature/domain/usecase/get_all_characters_usecase.dart';
import 'package:rick_and_morty_app/feature/infraestructure/external/get_characters_datasourceImpl.dart';

import '../../infraestructure/repository/characters_repositoryImpl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      // TODO: implement createState
      _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetAllCharactersUsecase usecase = GetAllCharactersUsecaseImpl(
      repository:
          CharactersRepositoryImpl(datasource: GetCharactersDatasourceImpl()));
  final String  firstName = "personagem";


    void getAllCharacters()async {

    var dados = await usecase.getAllCharacters();
    var firstName = dados.first.name;

    }
  @override
  void initState() {
    super.initState();
 getAllCharacters();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Consumo de API',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Text(firstName
      ),
    );
  }
}
