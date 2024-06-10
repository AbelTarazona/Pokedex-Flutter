part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  final List<Pokemon> pokemons;
  final bool isLoading;
  final bool hasReachedMax;
  final String errorMessage;

  const PokemonState({
    this.pokemons = const [],
    this.isLoading = false,
    this.hasReachedMax = false,
    this.errorMessage = '',
  });

  PokemonState copyWith({
    List<Pokemon>? pokemons,
    bool? isLoading,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [pokemons, isLoading, hasReachedMax, errorMessage];
}