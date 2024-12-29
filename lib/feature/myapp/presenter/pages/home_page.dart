import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:rick_and_morty_app/feature/myapp/domain/usecase/get_all_characters_usecase.dart';
import 'package:rick_and_morty_app/feature/myapp/infraestructure/external/get_characters_datasourceImpl.dart';

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
  List<Widget> widgets2 = [];
  var names = '';

  dynamic loading = CircularProgressIndicator();
  bool carregar = true;


  void getAllCharacters() async {
    var dados = await usecase.getAllCharacters();

    setState(() {
      firstName = dados.first.name;
      carregar = false;
     // var names = dados.map((e) => Text(e.name));

      List<Widget> widgets = dados
          .map((cachacters) => ListTile(
                title: Text(cachacters.name.toUpperCase()),
                leading: Icon(Icons.person_2),
              ))
          .toList();
      widgets2 = widgets;
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
        title: const Text("API Rick and Morty"),
        backgroundColor: Colors.purple,
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
        surfaceTintColor: Colors.white,
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
       // padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: //Center(
            //   child: Center(
            //  children: [
            
            carregar
                ? Center(child: loading)
                : ListView(
                    children: [
                      for (int i = 0; i < widgets2.length; i++)
                        OverflowBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                
                                },
                                child: widgets2[i] )
                          ],
                        ),
                    ],
                  ),
        // ],
      ),
    );
  }
}
