import 'package:flutter/material.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.white.withOpacity(0.05), Colors.white.withOpacity(0.2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Hero(
        tag: pokemon.image,
        child: Image.network(
          pokemon.image,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
