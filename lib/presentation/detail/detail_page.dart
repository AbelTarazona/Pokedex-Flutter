import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/core/utils/extensions.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/presentation/detail/widgets/documentation.dart';
import 'package:pokemon_challenge/presentation/detail/widgets/header.dart';
import 'package:pokemon_challenge/presentation/detail/widgets/information.dart';
import 'package:pokemon_challenge/presentation/home/bloc/pokemon_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.pokemon});

  final Pokemon pokemon;

  static Route<void> route({required Pokemon pokemon}) {
    return MaterialPageRoute(
      builder: (_) => DetailPage(pokemon: pokemon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        title: Text(pokemon.name.capitalizeFirst()),
        actions: [
          BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              bool isFavorite = state.pokemons.where((p) => p.name == pokemon.name).single.isFavorite;
              return IconButton(
                onPressed: () {
                  BlocProvider.of<PokemonBloc>(context).add(
                    SavePokemon(pokemon: pokemon),
                  );
                },
                icon: isFavorite
                    ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
                    : const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.white,
                ),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Header(pokemon: pokemon),
              const SizedBox(height: 30),
              Information(pokemon: pokemon),
              const SizedBox(height: 30),
              Documentation(
                pokemon: pokemon,
              )
            ],
          ),
        ),
      ),
    );
  }
}
