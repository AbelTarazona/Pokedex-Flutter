import 'package:flutter/material.dart';
import 'package:pokemon_challenge/core/config/app_colors.dart';

class CentralButton extends StatelessWidget {
  const CentralButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: AppColors.orange,
        shape: BoxShape.circle,
      ),
      child: Image.asset('assets/images/game-icons_fire-ray.png', height: 40,),
    );
  }
}
