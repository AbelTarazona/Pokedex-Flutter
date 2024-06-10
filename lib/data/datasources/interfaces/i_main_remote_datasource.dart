import 'package:pokemon_challenge/data/models/pagination_parameters_model.dart';
import 'package:pokemon_challenge/data/models/pokemon_model.dart';

abstract class IMainRemoteDatasource {
  Stream<PokemonModel> pokemonsStream({required PaginationParametersModel parameters});
}
