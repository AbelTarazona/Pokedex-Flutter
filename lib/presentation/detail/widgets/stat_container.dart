import 'package:flutter/material.dart';
import 'package:pokemon_challenge/core/config/app_colors.dart';
import 'package:pokemon_challenge/core/utils/extensions.dart';
import 'package:pokemon_challenge/domain/entities/stat.dart';
import 'package:pokemon_challenge/presentation/detail/widgets/background_gradient.dart';

class StatContainer extends StatelessWidget {
  const StatContainer({super.key, required this.stats});

  final List<Stat> stats;

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
      body: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, pos) {
          return Row(
            children: [
              Expanded(
                child: Text(
                  stats[pos].name.capitalizeFirst(),
                  maxLines: 1,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Text(stats[pos].quantity.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: LinearProgressIndicator(
                  value: stats[pos].quantity / 100,
                  backgroundColor: AppColors.gray2,
                  minHeight: 12,
                  borderRadius: BorderRadius.circular(100),
                  valueColor: const AlwaysStoppedAnimation(AppColors.yellow),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, pos) {
          return const SizedBox(height: 10);
        },
        itemCount: stats.length,
      ),
    );
  }
}
