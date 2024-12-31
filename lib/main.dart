import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/feature/myapp/presenter/pages/character_page.dart';
import 'feature/myapp/presenter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
return MaterialApp(
  initialRoute: '/' ,
  routes: {'/characterPage' : (context) => CharacterPage(),
  '/' : (context) => HomePage(),
  }
);
  }
}
