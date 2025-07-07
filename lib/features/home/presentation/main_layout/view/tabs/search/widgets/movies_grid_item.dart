import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';

import '../../../../../../domain/entity/movie_entity.dart';

class MovieGridItem extends StatelessWidget {
  final MovieEntity movie;

  const MovieGridItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          children: [
            Image.network(
              movie.poster,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    color: ColorsManager.grey,
                    child: const Center(child: Icon(Icons.broken_image)),
                  ),
            ),
            Positioned(
              top: 6,
              left: 6,
              child: Container(
                padding: REdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: ColorsManager.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: ColorsManager.yellow, size: 14),
                    const SizedBox(width: 3),
                    Text(
                      movie.rating.toString(),
                      style: const TextStyle(
                        color: ColorsManager.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
