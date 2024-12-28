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
   String firstName = "personagem";

     dynamic loading = const CircularProgressIndicator();
bool carregar = true;
  void getAllCharacters() async {
    var dados = await usecase.getAllCharacters();

    setState((){
    firstName = dados.first.name;
    carregar = false;

     });
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
        title: const Text("API de conselho"),
        backgroundColor: Colors.purple,
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
        surfaceTintColor: Colors.white,
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
            carregar ? loading : Text(firstName),
              Container(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
