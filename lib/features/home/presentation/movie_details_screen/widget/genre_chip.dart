import 'package:flutter/material.dart';

import '../../../../../core/resources/colors_manager.dart';

class GenreChip extends StatelessWidget {
  final String label;

  const GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: ColorsManager.darkGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
