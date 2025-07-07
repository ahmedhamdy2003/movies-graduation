import 'package:flutter/cupertino.dart';

import '../../features/auth/presentation/authentication/reset_password/reset_password_view.dart';
import '../../features/auth/presentation/authentication/signIn/sign_in.dart';
import '../../features/auth/presentation/authentication/signUp/sign_up.dart';
import '../../features/home/presentation/main_layout/view/main_layout.dart';
import '../../features/onboarding/presentation/onboarding/onboarding.dart';


class RoutesManager {
  static const String onBoarding = "/onBoarding";
  static const String signUp = "/signUp";
  static const String signIn = "/signIn";
  static const String resetPassword = "/resetPassword";
  static const String home = "/main_layout";

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return CupertinoPageRoute(builder: (context) => OnBoarding());
      case signUp:
        return CupertinoPageRoute(builder: (context) => const SignUp());
      case signIn:
        return CupertinoPageRoute(builder: (context) => const SignIn());
      case resetPassword:
        return CupertinoPageRoute(
          builder: (context) => const ResetPasswordView(),
        );
        case home:
        return CupertinoPageRoute(
          builder: (context) => const MainLayOut(),
        );
    }
  }
}
