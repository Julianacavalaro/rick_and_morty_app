import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/feature/myapp/presenter/controller/get_all_characters_controller.dart';

import '../../domain/usecase/get_all_characters_usecase.dart';
import '../../infraestructure/external/get_characters_datasourceImpl.dart';
import '../../infraestructure/repository/characters_repositoryImpl.dart';

class CharacterPageArg {
  final String name;
  final String image;
  final String status;

  CharacterPageArg(
      {required this.status, required this.name, required this.image});
}

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() =>
      // TODO: implement createState
      _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  GetAllCharactersController controller = GetAllCharactersControllerImpl(
      usecase: GetAllCharactersUsecaseImpl(
          repository: CharactersRepositoryImpl(
              datasource: GetCharactersDatasourceImpl())));
  bool carregar = true;
  void getCharacter() async {}

  @override
  void initState() {
    super.initState();
    getCharacter();
  }

  @override
  Widget build(BuildContext context) {
    carregar = false;
    final args = ModalRoute.of(context)!.settings.arguments as CharacterPageArg;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
        backgroundColor: Colors.purple,
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
        surfaceTintColor: Colors.white,
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: carregar
            ? const CircularProgressIndicator()
            : Column(children: [
                Image.network(args.image),
                Text(args.name),
                Text(args.status,
                    style: TextStyle(
                        color: controller.getColor(args.status),
                        fontFamily: AutofillHints.postalCode,
                        decorationStyle: TextDecorationStyle.dashed,
                        fontWeight: FontWeight.w900)),
              ]),
      ),
    );
  }
}
