import 'package:flutter/material.dart';

import '../../../../../core/resources/colors_manager.dart';

class InfoBox extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoBox({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: ColorsManager.darkGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.yellowAccent),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
