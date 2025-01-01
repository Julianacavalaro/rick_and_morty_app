import 'package:flutter/material.dart';

class CharacterPageArg {
  final String name;
  final String image;
    final String status;


  CharacterPageArg({required this.status, required this.name, required this.image});
}

class CharacterPage extends StatefulWidget {
  CharacterPage({super.key});

  @override
  State<CharacterPage> createState() =>
      // TODO: implement createState
      _CharacterPageState();
      
}

class _CharacterPageState extends State<CharacterPage> {
  bool carregar = true;
  void getCharacter() async {
    // var dado = await usecase.getCharacter();
  }

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
        
        child: carregar ? const CircularProgressIndicator(): Column(children: [
          Image.network(args.image),
                    Text(args.name),
                 args.status == 'Alive' ? Text(args.status, style: 
                const TextStyle(color: Color.fromARGB(255, 56, 137, 59),
                 fontFamily: AutofillHints.postalCode,
                 decorationStyle: TextDecorationStyle.dashed,
                 fontWeight :FontWeight.w900 )) : Text(args.status)
                
        
        ]),
      ),
    );
  }
}
