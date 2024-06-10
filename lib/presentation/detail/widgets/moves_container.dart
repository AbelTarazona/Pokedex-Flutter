import 'package:flutter/material.dart';
import 'package:pokemon_challenge/presentation/detail/widgets/background_gradient.dart';
import 'package:pokemon_challenge/presentation/detail/widgets/pill.dart';

class MovesContainer extends StatelessWidget {
  const MovesContainer({super.key, required this.moves});

  final List<String> moves;

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
      body: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: moves.take(8)
              .map(
                (move) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Pill(title: move),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
