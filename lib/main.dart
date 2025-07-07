import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/provider/change_language_provider.dart';
import 'package:provider/provider.dart';

import 'core/prefs_manager/prefs_manager.dart';
import 'core/resources/get_it/get_it.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/home/presentation/main_layout/cubit/home_cubit.dart';
import 'movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final seenOnboarding = await OnBoardingPrefs.isOnBoardingSeen();
  await configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => getIt<AuthCubit>(),
        ),
        BlocProvider<HomeCubit>(create: (_) => getIt<HomeCubit>()),
      ],
      child: ChangeNotifierProvider(
        create: (context) => ChangeLanguageProvider(),
        child: MoviesApp(seenOnboarding: seenOnboarding),
      ),
    ),
  );
}
