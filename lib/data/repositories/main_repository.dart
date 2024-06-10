import 'package:dartz/dartz.dart';
import 'package:pokemon_challenge/data/datasources/interfaces/i_main_remote_datasource.dart';
import 'package:pokemon_challenge/data/exceptions/general_exception.dart';
import 'package:pokemon_challenge/data/mappers/main_mapper.dart';
import 'package:pokemon_challenge/data/models/pokemon_model.dart';
import 'package:pokemon_challenge/domain/entities/pagination.dart';
import 'package:pokemon_challenge/domain/entities/pagination_parameters.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/domain/failures/failure.dart';
import 'package:pokemon_challenge/domain/repositories/i_main_repository.dart';

class MainRepository implements IMainRepository {
  final IMainRemoteDatasource mainRemoteDatasource;

  MainRepository({
    required this.mainRemoteDatasource,
  });

  @override
  Stream<Pokemon> pokemonList(
      {required PaginationParameters parameters}) async* {
    try {
      await for (PokemonModel pokemonModel in mainRemoteDatasource.pokemonsStream(
          parameters: parameters.toModel())) {
        yield pokemonModel.toEntity();
      }
    } on GeneralException catch (e) {
      throw Failure(e.message);
    }
  }
}
