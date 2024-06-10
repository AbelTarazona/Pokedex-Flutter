import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key, required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(detail, style: const TextStyle(color: Colors.white),),
      ],
    );
  }
}
