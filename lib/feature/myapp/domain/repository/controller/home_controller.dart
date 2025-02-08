import 'package:rick_and_morty_app/feature/myapp/domain/entity/character_entity.dart';
import '../../../infraestructure/external/get_characters_datasourceImpl.dart';
import '../../../infraestructure/repository/characters_repositoryImpl.dart';
import '../../usecase/get_all_characters_usecase.dart';


class HomeController {
  final GetAllCharactersUsecase _usecase = GetAllCharactersUsecaseImpl(
    repository: CharactersRepositoryImpl(datasource: GetCharactersDatasourceImpl()),
  );

  bool isLoading = true;
  List<CharacterEntity> characters = [];

  Future<void> getAllCharacters() async {
    characters = await _usecase.getAllCharacters();
    isLoading = false;
  }
}