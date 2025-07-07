import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie_app/core/resources/assets_manager.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';
import 'package:my_movie_app/features/home/domain/entity/movie_entity.dart';

class BuildMovies extends StatelessWidget {
  final MovieEntity movie;

  const BuildMovies({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              Image.network(
                movie.poster,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    ImageAssets.backGround,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  padding: REdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: ColorsManager.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: ColorsManager.yellow, size: 16),
                      SizedBox(width: 4.w),
                      Text(
                        movie.rating.toString(),
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontSize: 12.sp,
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
