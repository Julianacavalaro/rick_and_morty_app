import 'package:flutter/material.dart';

class CharacterPageArg{
   String name;
   String image;

  CharacterPageArg({ required this.name, required this.image});
}

class CharacterPage extends StatefulWidget {
  CharacterPageArg? args = CharacterPageArg(name: 'name', image: 'image');
  
   CharacterPage({super.key, this.args });
  
  @override
  State<CharacterPage> createState() =>
    // TODO: implement createState
    _CharacterPageState();
  

}

class _CharacterPageState extends State<CharacterPage>{
 
void getCharacter() async {
 // var dado = await usecase.getCharacter();
}

 @override void initState() {
    super.initState();
getCharacter();
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
      body: Container(padding:  const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Text(widget.args!.name)
      )
        );
  
  }
}