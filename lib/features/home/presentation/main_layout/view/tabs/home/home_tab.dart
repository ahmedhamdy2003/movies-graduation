import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';
import 'package:my_movie_app/features/home/domain/entity/movie_entity.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/view/tabs/home/widgets/build_movies.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/view/tabs/home/widgets/build_suggestion.dart';

import '../../../../../../../core/resources/assets_manager.dart';
import '../../../cubit/home_cubit.dart';
import '../../../cubit/home_state.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSuccess) {
          return Stack(
            children: [
              if (state.movies.isNotEmpty)
                Positioned.fill(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      ColorsManager.black.withOpacity(0.6),
                      BlendMode.darken,
                    ),
                    child: Image.network(
                      state.movies[currentIndex].poster,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          ImageAssets.backGround,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Center(child: Image.asset(ImageAssets.availableNow)),
                    CarouselSlider(
                      items:
                          state.movies.asMap().entries.map((entry) {
                            MovieEntity movie = entry.value;
                            return BuildMovies(movie: movie);
                          }).toList(),
                      options: CarouselOptions(
                        height: 280.h,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2,
                        viewportFraction: 0.65,
                        enableInfiniteScroll: true,
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 32.0),
                      child: Image.asset(ImageAssets.watchNow),
                    ),
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16.0),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Action",
                              style: TextStyle(
                                color: ColorsManager.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "See More",
                                  style: TextStyle(color: ColorsManager.yellow),
                                ),
                                SizedBox(width: 5.w),
                                Icon(
                                  Icons.arrow_forward,
                                  color: ColorsManager.yellow,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 150.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.suggestions.length,
                        padding: REdgeInsets.symmetric(horizontal: 12),
                        itemBuilder: (context, index) {
                          final movie = state.suggestions[index];
                          return BuildSuggestion(movie: movie);
                        },
                      ),
                    ),

                    SizedBox(height: 80.h),
                  ],
                ),
              ),
            ],
          );
        } else if (state is HomeFailure) {
          return Center(
            child: Text(
              state.failure.toString(),
              style: TextStyle(color: ColorsManager.red),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
