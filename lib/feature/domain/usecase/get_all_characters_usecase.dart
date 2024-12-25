import '../entity/character_entity.dart';
import '../repository/characters_repository.dart';

abstract class GetAllCharactersUsecase {
  Future<List<CharacterEntity>> getAllCharacters();
}

class GetAllCharactersUsecaseImpl implements GetAllCharactersUsecase {
  final CharactersRepository repository;

  GetAllCharactersUsecaseImpl({required this.repository});

  @override
  Future<List<CharacterEntity>> getAllCharacters() async {
    final List<CharacterEntity> list;

    try {
      list = await repository.getCharacters();
    } catch (e) {
      throw UnimplementedError('Erro Usecase');
    }
    return list;
  }
}
