import 'package:flutter/material.dart';

class OnBoardingPageModel {
  final String imagePath;
  final String title;
  final String description;
  final bool isLast;
  final Gradient backgroundGradient;

  OnBoardingPageModel({
    required this.backgroundGradient,
    required this.imagePath,
    required this.title,
    required this.description,
    this.isLast = false,
  });
}
