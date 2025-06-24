import 'package:flutter/cupertino.dart';
import 'package:my_movie_app/provider/change_language_provider.dart';
import 'package:provider/provider.dart';

import 'core/prefs_manager/prefs_manager.dart';
import 'movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final seenOnboarding = await OnBoardingPrefs.isOnBoardingSeen();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChangeLanguageProvider(),
      child: MoviesApp(seenOnboarding: seenOnboarding),
    ),
  );
}
