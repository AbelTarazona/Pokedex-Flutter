import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/presentation/home/bloc/pokemon_bloc.dart';
import 'package:pokemon_challenge/presentation/home/widgets/error.dart';
import 'package:pokemon_challenge/presentation/home/widgets/item.dart';

class PokemonStreamList extends StatefulWidget {
  const PokemonStreamList({super.key});

  @override
  State<PokemonStreamList> createState() => _PokemonStreamListState();
}

class _PokemonStreamListState extends State<PokemonStreamList> {
  final ScrollController _scrollController = ScrollController();
  final int _limit = 20;
  late PokemonBloc _pokemonListBloc;

  @override
  void initState() {
    super.initState();
    _pokemonListBloc = BlocProvider.of<PokemonBloc>(context);
    _pokemonListBloc.add(LoadPokemon(offset: 0, limit: _limit));

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
          !(_pokemonListBloc.state.isLoading) &&
          !(_pokemonListBloc.state.hasReachedMax)) {
        _pokemonListBloc.add(LoadPokemon(
            offset: _pokemonListBloc.state.pokemons.length,
            limit: _limit));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state.isLoading && state.pokemons.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.errorMessage.isNotEmpty) {
          return Center(child: ErrorState(msg: state.errorMessage));
        }

        return Expanded(
          child: GridView.builder(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              childAspectRatio: 1.0,
            ),
            itemCount: state.hasReachedMax ? state.pokemons.length : state.pokemons.length + 1,
            itemBuilder: (context, index) {
              if (index == state.pokemons.length) {
                return const Center(child: CircularProgressIndicator(color: Colors.white,));
              }
              final pokemon = state.pokemons[index];
              return Item(pokemon: pokemon);
            },
          ),
        );
      },
    );
  }
}

