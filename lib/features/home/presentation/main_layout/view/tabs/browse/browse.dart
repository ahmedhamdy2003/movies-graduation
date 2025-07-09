import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';

import '../../../../../../../core/resources/get_it/get_it.dart';
import '../../../../../data/model/browse_movie_model.dart';
import '../../../cubit/browse_cubit/browse_cubit.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  final List<String> categories = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Comedy',
    'Crime',
    'Drama',
    'Fantasy',
  ];

  String selectedCategory = 'Action';

  late final BrowseCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<BrowseCubit>();
    cubit.getMovies(selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildCategoriesBar(),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<BrowseCubit, BrowseState>(
                bloc: cubit,
                builder: (context, state) {
                  if (state is BrowseLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.yellow),
                    );
                  } else if (state is BrowseLoaded) {
                    return _buildMoviesGrid(state.movies);
                  } else if (state is BrowseError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesBar() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = categories[index] == selectedCategory;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = categories[index];
              });
              cubit.getMovies(selectedCategory);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.yellow : Colors.transparent,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(color: Colors.yellow, width: 1.5),
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.4),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ]
                    : [],
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                child: Text(categories[index]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMoviesGrid(List<MovieModel> movies) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 10,
        childAspectRatio: 0.65,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Container(
          decoration: BoxDecoration(
            color: ColorsManager.darkGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        movie.image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '⭐ ${movie.rating}',
                          style: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
