import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movie_app/core/resources/assets_manager.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';
import 'package:my_movie_app/core/resources/get_it/get_it.dart';
import 'package:my_movie_app/features/home/presentation/movie_details_screen/widget/genre_chip.dart';
import 'package:my_movie_app/features/home/presentation/movie_details_screen/widget/info_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entity/movie_entity.dart';
import '../main_layout/cubit/details_cubit/details_cubit.dart';
import '../main_layout/cubit/details_cubit/details_state.dart';
import '../main_layout/view/tabs/search/widgets/movies_grid_item.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  bool isSaved = false;

  Future<void> _checkIfFavorite(int movieId) async {
    final prefs = getIt<SharedPreferences>();
    final history = prefs.getStringList('movie_history') ?? [];
    setState(() {
      isSaved = history.any((item) {
        final map = jsonDecode(item);
        return map['id'] == movieId;
      });
    });
  }

  void _toggleFavorite(MovieEntity movie) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList('movie_history') ?? [];
    final entry = jsonEncode({
      'id': movie.id,
      'title': movie.title,
      'poster': movie.poster,
      'rating': movie.rating,
    });

    if (!isSaved) {
      current.insert(0, entry);
      await prefs.setStringList('movie_history', current.take(10).toList());
    } else {
      current.removeWhere((e) => jsonDecode(e)['id'] == movie.id);
      await prefs.setStringList('movie_history', current);
    }

    setState(() {
      isSaved = !isSaved;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(isSaved ? 'Added to history' : 'Removed from history')),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkIfFavorite(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<MovieDetailsCubit>()
        ..fetchMovieDetails(widget.movieId),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(child: CircularProgressIndicator(
                color: ColorsManager.yellow,));
            } else if (state is MovieDetailsError) {
              return Center(
                child: Text(
                    state.message, style: const TextStyle(color: Colors.white)),
              );
            } else if (state is MovieDetailsSuccess) {
              final movie = state.movie;
              final movieEntity = MovieEntity(
                id: movie.id,
                title: movie.title,
                poster: movie.poster,
                rating: movie.rating,
                year: movie.year,
                genres: movie.genres,
                description: movie.description,
                backgroundImage: movie.backgroundImage,
                screenshots: movie.screenshots,
                runtime: movie.runtime,
                likeCount: movie.likeCount,
              );

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          movie.poster,
                          width: double.infinity,
                          height: 450.h,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                          const Icon(Icons.broken_image, size: 80,
                              color: ColorsManager.grey),
                        ),
                        Container(
                          width: double.infinity,
                          height: 450.h,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black38,
                                Colors.black54,
                                Colors.black
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          right: 16,
                          child: IconButton(
                            icon: Icon(
                              isSaved ? Icons.bookmark : Icons
                                  .bookmark_border_rounded,
                              color: ColorsManager.white,
                              size: 40.h,
                            ),
                            onPressed: () => _toggleFavorite(movieEntity),
                          ),
                        ),
                        Positioned.fill(
                          child: Padding(
                            padding: REdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 80.h,
                                  padding: REdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    color: ColorsManager.yellow,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    SvgAssets.moviePlayIcon,
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  movie.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  movie.year.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                SizedBox(height: 10.h),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorsManager.lightRed,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Watch",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    InfoBox(icon: Icons.favorite,
                                        label: "${movie.likeCount ?? 0}"),
                                    InfoBox(icon: Icons.schedule,
                                        label: "${movie.runtime ?? 0}"),
                                    InfoBox(icon: Icons.star,
                                        label: movie.rating.toStringAsFixed(1)),
                                  ],
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    if (movie.screenshots != null &&
                        movie.screenshots!.isNotEmpty) ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Screenshots",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 550.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: movie.screenshots!.length,
                          separatorBuilder: (_, __) =>
                          const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final screenshot = movie.screenshots![index];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                screenshot,

                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                const Icon(
                                    Icons.broken_image, color: Colors.grey),
                              ),
                            );
                          },
                        ),
                      ),
                    ],

                    if (state.similarMovies.isNotEmpty) ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Similar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 450.h,
                        child: GridView.builder(
                          padding: REdgeInsets.symmetric(horizontal: 16),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.w,
                            mainAxisSpacing: 12.h,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            final movie = state.similarMovies[index];
                            return MovieGridItem(movie: movie);
                          },
                        ),
                      ),

                    ],
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Summary",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 12),

                          Text(
                            movie.description?.isNotEmpty == true
                                ? movie.description!
                                : "No description available.",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.justify,
                          ),

                          const SizedBox(height: 30),
                          const Text(
                            "Genres",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: movie.genres?.map((genre) =>
                                GenreChip(label: genre)).toList() ?? [],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}