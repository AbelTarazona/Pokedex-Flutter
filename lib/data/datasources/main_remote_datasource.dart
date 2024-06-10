import 'package:pokemon_challenge/core/services/api_service.dart';
import 'package:pokemon_challenge/data/datasources/interfaces/i_main_remote_datasource.dart';
import 'package:pokemon_challenge/data/exceptions/api_exception.dart';
import 'package:pokemon_challenge/data/exceptions/general_exception.dart';
import 'package:pokemon_challenge/data/models/pagination_parameters_model.dart';
import 'package:pokemon_challenge/data/models/pokemon_model.dart';

class MainRemoteDatasource implements IMainRemoteDatasource {
  final ApiService apiService;

  MainRemoteDatasource({required this.apiService});

  @override
  Stream<PokemonModel> pokemonsStream({
    required PaginationParametersModel parameters,
  }) async* {
    try {
      final response = await apiService.get(
        endpoint: 'pokemon?limit=${parameters.limit}&offset=${parameters.offset}',
      );

      final List<dynamic> results = response['results'];

      for (var result in results) {
        PokemonModel pokemon = await getPokemon(detailUrl: result['url']);
        yield pokemon;
      }
    } on ApiException catch (e) {
      throw GeneralException(e.detail);
    } catch (e) {
      throw GeneralException('Error al obtener pokemones: $e');
    }
  }

  Future<PokemonModel> getPokemon({required String detailUrl}) async {
    // Get the detail of the pokemon
    final detailResponse = await apiService.get(endpoint: detailUrl, useBaseUrl: false);
    PokemonModel item = PokemonModel.fromJson(detailResponse);

    // Get the species details to fetch the color
    final speciesResponse = await apiService.get(endpoint: item.speciesUrl, useBaseUrl: false);
    item.color = speciesResponse['color']['name'];

    return item;
  }
}
