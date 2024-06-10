import 'package:pokemon_challenge/data/models/stat_model.dart';

class PokemonModel {
  final String name;
  final String imageUrl;
  final String speciesUrl;
  final int height;
  final int weight;
  final List<StatModel> stats;
  final List<String> moves;
  String? color;

  PokemonModel({
    required this.name,
    required this.imageUrl,
    required this.speciesUrl,
    required this.height,
    required this.weight,
    required this.stats,
    required this.moves,
    this.color,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      speciesUrl: json['species']['url'],
      height: json['height'],
      weight: json['weight'],
      stats: (json['stats'] as List)
          .map((statJson) => StatModel.fromJson(statJson))
          .toList(),
      moves: (json['moves'] as List)
          .map((moveJson) => moveJson['move']['name'] as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'speciesUrl': speciesUrl,
      'height': height,
      'weight': weight,
      'stats': stats.map((stat) => stat.toJson()).toList(),
      'moves': moves,
      'color': color,
    };
  }
}