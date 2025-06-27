import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/routes_manager/routes_manager.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_localization.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entity/user_entity.dart';
import '../../cubit/auth_state.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool secure = true;
  late TextEditingController emailController ;
  late TextEditingController passwordController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  void _onClick() {
    setState(() {
      secure = !secure;
    });
  }

  void _onLoginPressed() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    context.read<AuthCubit>().signIn(
      UserEntity(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('login success')),
          );
          Navigator.pushReplacementNamed(context, RoutesManager.home);
        } else if (state is AuthFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.failure.errMessage)),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Expanded(child: Image.asset(ImageAssets.logo)),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 24.h),
                      CustomTextFormField(
                        controller: emailController,
                        label: AppLocalizations.of(context)!.email,
                        prefixIcon: Icons.email_rounded,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        controller: passwordController,
                        isSecure: secure,
                        label: AppLocalizations.of(context)!.password,
                        prefixIcon: Icons.lock,
                        suffixIcon:
                        secure ? Icons.visibility_off : Icons.visibility,
                        onPress: _onClick,
                      ),
                      CustomTextButton(
                        title: AppLocalizations.of(context)!.forget_password,
                        onPress: () {
                          Navigator.pushNamed(
                              context, RoutesManager.resetPassword);
                        },
                      ),
                      CustomElevatedButton(
                        title: AppLocalizations.of(context)!.login,
                        onPress: _onLoginPressed,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dont_have_account,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          CustomTextButton(
                            title: AppLocalizations.of(context)!.create_one,
                            onPress: () {
                              Navigator.pushReplacementNamed(
                                  context, RoutesManager.signUp);
                            },
                          ),
                        ],
                      ),
                      CustomDivider(title: AppLocalizations.of(context)!.or),
                      SizedBox(height: 24.h),
                      CustomButton(
                        title:
                        AppLocalizations.of(context)!.login_with_google,
                        onTap: () {
                        },
                      ),
                      SizedBox(height: 24.h),
                      CustomLocalization(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
