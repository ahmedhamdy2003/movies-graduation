import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie_app/core/extensions/build_context_extension.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/constant_manager.dart';
import '../../../../l10n/app_localizations.dart';

class AvatarCarousel extends StatefulWidget {
  const AvatarCarousel({super.key});

  @override
  State<AvatarCarousel> createState() => _AvatarCarouselState();
}

class _AvatarCarouselState extends State<AvatarCarousel> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: ConstantsManager.avatarList.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: _selectedIndex == index ? ColorsManager.yellow : ColorsManager.grey,width: 3
                  ),
                ),
                child: CircleAvatar(
                  radius: 45.r,
                  backgroundImage: AssetImage(ConstantsManager.avatarList[index]),
                ),
              ),
            );

          }, options:  CarouselOptions(
            height: context.getScreenHeight * 0.15,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            viewportFraction: 0.3,
            onPageChanged: (index, reason) {
              _selectedIndex = index;
            }),
        ),
        SizedBox(height: 8.h),
        Text(
          AppLocalizations.of(context)!.avatar,
          style: TextStyle(
            color: ColorsManager.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
