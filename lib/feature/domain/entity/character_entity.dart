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
  /* 
  {
  "info": {
    "count": 826,
    "pages": 42,
    "next": "https://rickandmortyapi.com/api/character/?page=2",
    "prev": null
  },
  "results": [
    {
      "id": 1,
      "name": "Rick Sanchez",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Male",
      "origin": {
        "name": "Earth",
        "url": "https://rickandmortyapi.com/api/location/1"
      },
      "location": {
        "name": "Earth",
        "url": "https://rickandmortyapi.com/api/location/20"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
        // ...
      ],
      "url": "https://rickandmortyapi.com/api/character/1",
      "created": "2017-11-04T18:48:46.250Z"
    },
    // ...
  ]
}
  */
}
