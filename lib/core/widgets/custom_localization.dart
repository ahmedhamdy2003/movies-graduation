import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/change_language_provider.dart';
import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';

class CustomLocalization extends StatefulWidget {
  const CustomLocalization({super.key});

  @override
  State<CustomLocalization> createState() => _CustomLocalizationState();
}

class _CustomLocalizationState extends State<CustomLocalization> {
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<ChangeLanguageProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: ColorsManager.black,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.yellow, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  langProvider.changeAppLang('en');
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        langProvider.currentLang == 'en'
                            ? Border.all(color: Colors.yellow, width: 3)
                            : null,
                  ),
                  child: Image.asset(
                    ImageAssets.LR,
                    fit: BoxFit.cover,
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  langProvider.changeAppLang('ar');
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        langProvider.currentLang == 'ar'
                            ? Border.all(color: Colors.yellow, width: 3)
                            : null,
                  ),
                  child: Image.asset(
                    ImageAssets.EG,
                    fit: BoxFit.cover,
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
