import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_challenge/domain/entities/pagination_parameters.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/domain/repositories/i_main_repository.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final IMainRepository repository;

  PokemonBloc({required this.repository}) : super(const PokemonState()) {
    on<LoadPokemon>(_onLoadPokemon);
    on<SavePokemon>(_onSavePokemon);
  }

  FutureOr<void> _onLoadPokemon(
      LoadPokemon event, Emitter<PokemonState> emit) async {
    if (state.isLoading || state.hasReachedMax) return;

    emit(state.copyWith(isLoading: true));

    PaginationParameters paginationParameters =
        PaginationParameters(offset: event.offset, limit: event.limit);

    try {
      final Stream<Pokemon> stream =
          repository.pokemonList(parameters: paginationParameters);
      await for (final pokemon in stream) {
        final updatedPokemons = List<Pokemon>.from(state.pokemons)
          ..add(pokemon);
        emit(state.copyWith(
          pokemons: updatedPokemons,
          isLoading: false,
          hasReachedMax: updatedPokemons.length < event.limit,
        ));
      }
    } catch (error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    }
  }

  FutureOr<void> _onSavePokemon(SavePokemon event, Emitter<PokemonState> emit) {
    final updatedPokemons = state.pokemons.map((pokemon) {
      if (pokemon.name == event.pokemon.name) {
        return event.pokemon.copyWith(isFavorite: !event.pokemon.isFavorite);
      }
      return pokemon;
    }).toList();
    emit(state.copyWith(pokemons: updatedPokemons));
  }
}
