import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie_app/core/extensions/build_context_extension.dart';
import 'package:my_movie_app/provider/change_language_provider.dart';
import 'package:provider/provider.dart';

import 'config/theme/theme_manager.dart';
import 'core/routes_manager/routes_manager.dart';
import 'l10n/app_localizations.dart';


class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key, required this.seenOnboarding});

  final bool seenOnboarding;
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<ChangeLanguageProvider>(context);
    return ScreenUtilInit(
      designSize: Size(context.getScreenWidth, context.getScreenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.dark,
        darkTheme: ThemeManager.dark,
        onGenerateRoute: RoutesManager.router,
       initialRoute:  seenOnboarding
            ? RoutesManager.home
            : RoutesManager.onBoarding,
        locale: Locale(languageProvider.currentLang),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en'), Locale('ar')],
      ),
    );
  }
}
