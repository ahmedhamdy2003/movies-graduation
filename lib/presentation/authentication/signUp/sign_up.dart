import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie_app/core/extensions/build_context_extension.dart';
import 'package:my_movie_app/core/resources/constant_manager.dart';
import 'package:my_movie_app/presentation/authentication/signUp/widgets/avatar_carousel.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/routes_manager/routes_manager.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_localization.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.register)),

      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AvatarCarousel(),
              CustomTextFormField(
                label: AppLocalizations.of(context)!.name,
                prefixIcon: Icons.person_pin_outlined,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                label: AppLocalizations.of(context)!.email,
                prefixIcon: Icons.email_rounded,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                isSecure: secure,
                label: AppLocalizations.of(context)!.password,
                prefixIcon: Icons.lock,
                suffixIcon:
                secure ? Icons.visibility_off : Icons.visibility,
                onPress: _onClick,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                isSecure: secure,
                label: AppLocalizations.of(context)!.confirm_password,
                prefixIcon: Icons.lock,
                suffixIcon:
                secure ? Icons.visibility_off : Icons.visibility,
                onPress: _onClick,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                label: AppLocalizations.of(context)!.phone,
                prefixIcon: Icons.phone,
              ),
              SizedBox(height: 16.h),
              CustomElevatedButton(
                title: AppLocalizations.of(context)!.create_account,
                onPress: () {},
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
                      Navigator.pushNamed(
                        context,
                        RoutesManager.signIn,
                      );
                    },
                  ),

                ],
              ),
              CustomLocalization(),
              SizedBox(height: 16.h),

            ],
          ),
        )
      ),
    );
  }
  void _onClick() {
    setState(() {
      secure = !secure;
    });
  }
}
