import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/resources/assets_manager.dart';
import '../../../../../../../../core/resources/colors_manager.dart';
import '../../../../../../domain/entity/movie_entity.dart';

class BuildSuggestion extends StatelessWidget {
  const BuildSuggestion({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(right: 10),
      child: Container(
        width: 120.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Stack(
            children: [
              Image.network(
                movie.poster,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    ImageAssets.backGround,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
              Positioned(
                top: 6.h,
                left: 6.w,
                child: Container(
                  padding: REdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: ColorsManager.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: ColorsManager.yellow, size: 14),
                      SizedBox(width: 3.w),
                      Text(
                        movie.rating.toString(),
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
