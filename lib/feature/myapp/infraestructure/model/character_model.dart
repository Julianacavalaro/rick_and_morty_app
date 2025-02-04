import 'package:rick_and_morty_app/feature/myapp/domain/entity/character_entity.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel(
      {required super.name,
      required super.status,
      required super.species,
      required super.gender,
      required super.image,
      required super.episode});
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
      episode: List<String>.from(json['episode'] as List),
    );
  }
}
