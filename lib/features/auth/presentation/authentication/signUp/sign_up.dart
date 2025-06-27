import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie_app/core/extensions/text_extention.dart';
import 'package:my_movie_app/core/routes_manager/routes_manager.dart';
import 'package:my_movie_app/core/widgets/custom_elevated_button.dart';
import 'package:my_movie_app/core/widgets/custom_localization.dart';
import 'package:my_movie_app/core/widgets/custom_text_button.dart';
import 'package:my_movie_app/core/widgets/custom_text_form_field.dart';
import 'package:my_movie_app/features/auth/presentation/authentication/signUp/widgets/avatar_carousel.dart';
import 'package:my_movie_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_movie_app/l10n/app_localizations.dart';

import '../../../domain/entity/user_entity.dart';
import '../../cubit/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController nameController;
  late TextEditingController emailController ;
  late TextEditingController phoneController;
  late TextEditingController passwordController ;
  late TextEditingController confirmPasswordController ;

  bool securePassword = true;
  bool secureRePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
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
            SnackBar(content: Text('Register success')),
          );
          Navigator.pushReplacementNamed(context, RoutesManager.signIn);
        } else if (state is AuthFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
              state.failure.errMessage,),

            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.register)),
        body: SingleChildScrollView(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AvatarCarousel(),
              CustomTextFormField(
                controller: nameController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return "Plz, enter name";
                  }
                  return null;
                },
                label: AppLocalizations.of(context)!.name,
                prefixIcon: Icons.person_pin_outlined,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                controller: emailController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return "Plz, enter email";
                  }
                  if (!input.isValidEmail) {
                    return "Email bad format";
                  }
                  return null;
                },
                label: AppLocalizations.of(context)!.email,
                prefixIcon: Icons.email_rounded,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                controller: passwordController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return "Plz, enter password";
                  }
                  if (input.length < 6) {
                    return "sorry, password should be 6 character";
                  }
                  return null;
                },
                isSecure: securePassword,
                label: AppLocalizations.of(context)!.password,
                prefixIcon: Icons.lock,
                suffixIcon: securePassword ? Icons.visibility_off : Icons.visibility,
                onPress: _onPasswordIconClick,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                controller: confirmPasswordController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return "Plz, enter re-password";
                  }
                  if (input != passwordController.text) {
                    return "sorry, re-password should match password";
                  }
                  return null;
                },
                isSecure: secureRePassword,
                label: AppLocalizations.of(context)!.confirm_password,
                prefixIcon: Icons.lock,
                suffixIcon: secureRePassword ? Icons.visibility_off : Icons.visibility,
                onPress: _onRePasswordIconClick,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                controller: phoneController,
                label: AppLocalizations.of(context)!.phone,
                prefixIcon: Icons.phone,
              ),
              SizedBox(height: 16.h),
              CustomElevatedButton(
                title: AppLocalizations.of(context)!.create_account,
                onPress: _onRegisterPressed,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.already_have_account,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  CustomTextButton(
                    title: AppLocalizations.of(context)!.login,
                    onPress: () {
                      Navigator.pushReplacementNamed(context, RoutesManager.signIn);
                    },
                  ),
                ],
              ),
              CustomLocalization(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
  void _onPasswordIconClick() {
    securePassword = !securePassword;
    setState(() {});
  }

  void _onRePasswordIconClick() {
    secureRePassword = !secureRePassword;
    setState(() {});
  }
  void _onRegisterPressed() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    context.read<AuthCubit>().signUp(
      UserEntity(
        name: name,
        email: email,
        password: password,
        phone: phone,
      ),
    );
  }
}
