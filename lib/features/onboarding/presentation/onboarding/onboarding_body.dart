import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/prefs_manager/prefs_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/routes_manager/routes_manager.dart';
import 'onboarding_page_model.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.page,
    required this.index,
    required this.controller,
  });

  final OnBoardingPageModel page;
  final int index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(page.imagePath, fit: BoxFit.fill),
        Container(decoration: BoxDecoration(gradient: page.backgroundGradient)),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: REdgeInsets.all(16),
            decoration: BoxDecoration(
              color: index != 0 ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  page.title,
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: index != 0 ? 24.sp : 32.sp,
                    fontWeight: index != 0 ? FontWeight.bold : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (page.description.isNotEmpty) ...[
                  SizedBox(height: 16.h),
                  Text(
                    page.description,
                    style: TextStyle(
                      color:
                          index != 0
                              ? ColorsManager.white
                              : ColorsManager.white.withOpacity(0.6),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        backgroundColor: ColorsManager.yellow,
                        foregroundColor: ColorsManager.black,
                      ),
                      onPressed: () async {
                        if (page.isLast) {
                          await OnBoardingPrefs.setOnBoardingSeen();
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesManager.signIn,
                          );
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Text(
                        page.isLast
                            ? "Finish"
                            : index == 0
                            ? "Explore Now"
                            : "Next",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    if (index > 1)
                      OutlinedButton(
                        onPressed: () {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          foregroundColor: ColorsManager.yellow,
                          side: const BorderSide(color: ColorsManager.yellow),
                        ),
                        child: Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
