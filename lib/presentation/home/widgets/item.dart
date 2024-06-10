import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/core/utils/app_utils.dart';
import 'package:pokemon_challenge/core/utils/extensions.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/presentation/detail/detail_page.dart';
import 'package:pokemon_challenge/presentation/home/bloc/pokemon_bloc.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.of(context).push(DetailPage.route(pokemon: pokemon));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppUtils.getColorFromName(pokemon.color ?? ''),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: pokemon.image,
                      child: Image.network(
                        pokemon.image,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          pokemon.name.capitalizeFirst(),
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_circle_right_outlined,
                          color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                BlocProvider.of<PokemonBloc>(context).add(
                  SavePokemon(pokemon: pokemon),
                );
              },
              icon: pokemon.isFavorite
                  ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
                  : const Icon(
                Icons.favorite_border_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
