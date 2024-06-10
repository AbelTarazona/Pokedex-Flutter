import 'package:pokemon_challenge/domain/entities/stat.dart';

class Pokemon {
  final String name;
  final String image;
  final int height;
  final int weight;
  final List<Stat> stats;
  final List<String> moves;
  String? color;
  bool isFavorite;

  Pokemon({
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
    required this.stats,
    required this.moves,
    this.color,
    this.isFavorite = false,
  });

  Pokemon copyWith({
    String? name,
    String? image,
    int? height,
    int? weight,
    List<Stat>? stats,
    List<String>? moves,
    String? color,
    bool? isFavorite,
  }) {
    return Pokemon(
      name: name ?? this.name,
      image: image ?? this.image,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      stats: stats ?? this.stats,
      moves: moves ?? this.moves,
      color: color ?? this.color,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
