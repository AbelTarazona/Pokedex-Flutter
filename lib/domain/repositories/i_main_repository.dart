import 'package:dartz/dartz.dart';
import 'package:pokemon_challenge/domain/entities/pagination.dart';
import 'package:pokemon_challenge/domain/entities/pagination_parameters.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/domain/failures/failure.dart';

abstract class IMainRepository {
  Stream<Pokemon> pokemonList({
    required PaginationParameters parameters,
  });
}
