part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class LoadPokemon extends PokemonEvent {
  final int offset;
  final int limit;

  const LoadPokemon({required this.offset, required this.limit});

  @override
  List<Object> get props => [offset, limit];
}

class SavePokemon extends PokemonEvent {
  final Pokemon pokemon;

  const SavePokemon({required this.pokemon});

  @override
  List<Object> get props => [pokemon];
}
