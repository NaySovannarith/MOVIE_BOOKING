import 'package:flutter/material.dart';

class PromoteCard extends StatelessWidget {
  const PromoteCard({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
    );
  }
}
