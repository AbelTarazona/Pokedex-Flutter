import 'package:flutter/material.dart';
import 'package:pokemon_challenge/presentation/home/widgets/header.dart';
import 'package:pokemon_challenge/presentation/home/widgets/pokemon_stream_list.dart';
import 'package:pokemon_challenge/presentation/home/widgets/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          scrolledUnderElevation: 0.0,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle, color: Colors.white),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              SizedBox(height: 10),
              Search(),
              SizedBox(height: 20),
              //PokemonList(),
              PokemonStreamList(),
            ],
          ),
        ));
  }
}
