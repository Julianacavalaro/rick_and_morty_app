class CharacterEntity {
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final List<String> episode;
  CharacterEntity(
      {required this.name,
      required this.status,
      required this.species,
      required this.gender,
      required this.image,
      required this.episode});

  factory CharacterEntity.fromJson(Map<String, dynamic> json) {
    return CharacterEntity(
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
      episode: List<String>.from(json['episode'] as List),
    );
  }
  
}
