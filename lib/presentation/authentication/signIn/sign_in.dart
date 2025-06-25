import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/routes_manager/routes_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_divider.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_localization.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../l10n/app_localizations.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    CustomTextButton(
                      title: AppLocalizations.of(context)!.forget_password,
                      onPress: () {
                        Navigator.pushNamed(
                            context, RoutesManager.resetPassword);
                      },
                    ),
                    CustomElevatedButton(
                      title: AppLocalizations.of(context)!.login,
                      onPress: () {},
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
                            Navigator.pushNamed(
                              context,
                              RoutesManager.signUp,
                            );
                          },
                        ),
                      ],
                    ),
                    CustomDivider(title: AppLocalizations.of(context)!.or),
                    SizedBox(height: 24.h),
                    CustomButton(
                      title: AppLocalizations.of(context)!.login_with_google,
                      onTap: () {},
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
    );
  }

  void _onClick() {
    setState(() {
      secure = !secure;
    });
  }
}
