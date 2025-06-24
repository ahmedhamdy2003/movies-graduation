import 'package:flutter/material.dart';

import '../../core/resources/constant_manager.dart';
import 'onboarding_body.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: ConstantsManager.onboardingPages.length,
        onPageChanged: (index) => setState(() => currentIndex = index),
        itemBuilder: (context, index) {
          return OnboardingBody(
              page: ConstantsManager.onboardingPages[index],
              index: index,
              controller: _controller);
        },
      ),
    );
  }
}


