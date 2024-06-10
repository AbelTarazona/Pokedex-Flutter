import 'package:flutter/material.dart';
import 'package:pokemon_challenge/core/config/app_colors.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              AppColors.purple.withOpacity(0.45),
              AppColors.green.withOpacity(0.45)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: body,
      ),
    );
  }
}
