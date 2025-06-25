import 'package:flutter/material.dart';

import '../../presentation/onboarding/onboarding_page_model.dart';
import 'assets_manager.dart';
import 'colors_manager.dart';

class ConstantsManager {
  static List<OnBoardingPageModel> onboardingPages = [
    OnBoardingPageModel(
      imagePath: 'assets/images/onBoarding1.png',
      title: 'Find Your Next Favorite Movie Here',
      description:
          'Get access to a huge library of movies to suit all tastes. You will surely like it.',
      backgroundGradient: LinearGradient(
        colors: [ColorsManager.black.withOpacity(0), ColorsManager.black],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    OnBoardingPageModel(
      imagePath: 'assets/images/onBoarding2.png',
      title: 'Discover Movies',
      description:
          'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
      backgroundGradient: LinearGradient(
        colors: [ColorsManager.green.withOpacity(0), ColorsManager.green],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    OnBoardingPageModel(
      imagePath: 'assets/images/onBoarding3.png',
      title: 'Explore All Genres',
      description:
          'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
      backgroundGradient: LinearGradient(
        colors: [ColorsManager.red.withOpacity(0), ColorsManager.red],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    OnBoardingPageModel(
      imagePath: 'assets/images/onBoarding4.png',
      title: 'Create Watchlists',
      description:
          'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
      backgroundGradient: LinearGradient(
        colors: [ColorsManager.purple.withOpacity(0), ColorsManager.purple],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    OnBoardingPageModel(
      imagePath: 'assets/images/onBoarding5.png',
      title: 'Rate, Review, and Learn',
      description:
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
      backgroundGradient: LinearGradient(
        colors: [ColorsManager.darkRed.withOpacity(0), ColorsManager.darkRed],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    OnBoardingPageModel(
      imagePath: 'assets/images/onBoarding6.png',
      title: 'Start Watching Now',
      description: '',
      isLast: true,
      backgroundGradient: LinearGradient(
        colors: [ColorsManager.darkGrey.withOpacity(0), ColorsManager.darkGrey],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  ];

  static List<String> avatarList = [
    ImageAssets.avatar1,
    ImageAssets.avatar2,
    ImageAssets.avatar3,
    ImageAssets.avatar4,
    ImageAssets.avatar5,
    ImageAssets.avatar6,
    ImageAssets.avatar7,
    ImageAssets.avatar8,
    ImageAssets.avatar9,

  ];
}
