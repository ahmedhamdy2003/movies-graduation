import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/cubit/profile_cubit/profile_cubit.dart';
import 'package:provider/provider.dart';

import 'core/prefs_manager/prefs_manager.dart';
import 'core/resources/get_it/get_it.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/home/presentation/main_layout/cubit/browse_cubit/browse_cubit.dart';
import 'features/home/presentation/main_layout/cubit/home_cubit/home_cubit.dart';
import 'features/home/presentation/main_layout/cubit/search_cubit/search_cubit.dart';
import 'movie_app.dart';
import 'provider/change_language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check onboarding screen status
  final seenOnboarding = await OnBoardingPrefs.isOnBoardingSeen();

  // Setup dependency injection
  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => getIt<AuthCubit>(),
        ),
        BlocProvider<BrowseCubit>(
          create: (_) => getIt<BrowseCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>(),
        ),
        BlocProvider<SearchCubit>(
          create: (_) => getIt<SearchCubit>(),
        ), BlocProvider<ProfileCubit>(
          create: (_) => getIt<ProfileCubit>(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => ChangeLanguageProvider(),
        child: MoviesApp(seenOnboarding: seenOnboarding),
      ),
    ),
  );
}
