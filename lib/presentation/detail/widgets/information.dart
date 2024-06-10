import 'package:flutter/material.dart';
import 'package:pokemon_challenge/core/utils/app_utils.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/presentation/detail/widgets/central_button.dart';
import 'package:pokemon_challenge/presentation/detail/widgets/detail.dart';

class Information extends StatelessWidget {
  const Information({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Detail(title: '${AppUtils.decimeterToMeter(pokemon.height)} m', detail: 'Height'),
        const CentralButton(),
        Detail(title: '${AppUtils.hectogramToKilogram(pokemon.weight)} kg', detail: 'Weight'),
      ],
    );
  }
}
