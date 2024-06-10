import 'package:pokemon_challenge/data/models/pagination_parameters_model.dart';
import 'package:pokemon_challenge/data/models/pokemon_model.dart';
import 'package:pokemon_challenge/data/models/stat_model.dart';
import 'package:pokemon_challenge/domain/entities/pagination_parameters.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/domain/entities/stat.dart';

extension PaginationParametersMapper on PaginationParameters {
  PaginationParametersModel toModel() {
    return PaginationParametersModel(
      limit: limit,
      offset: offset,
    );
  }
}

extension PokemonModelMapper on PokemonModel {
  Pokemon toEntity() {
    return Pokemon(
      name: name,
      image: imageUrl,
      height: height,
      weight: weight,
      stats: stats.map((stat) => stat.toEntity()).toList(),
      moves: moves,
      color: color,
    );
  }
}

extension StatModelMapper on StatModel {
  Stat toEntity() {
    return Stat(
      name: name,
      quantity: baseStat,
    );
  }
}
