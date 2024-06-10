import 'package:flutter/material.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/presentation/detail/widgets/moves_container.dart';
import 'package:pokemon_challenge/presentation/detail/widgets/stat_container.dart';

class Documentation extends StatefulWidget {
  const Documentation({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<Documentation> createState() => _DocumentationState();
}

class _DocumentationState extends State<Documentation>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          labelStyle:
              const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          dividerHeight: 0.0,
          tabs: const [
            Tab(
              text: 'Stats',
            ),
            Tab(
              text: 'Moves',
            ),
          ],
          controller: tabController,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context) .size.height * 0.3,
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              StatContainer(stats: widget.pokemon.stats),
              MovesContainer(moves: widget.pokemon.moves),
            ],
          ),
        ),
      ],
    );
  }
}
