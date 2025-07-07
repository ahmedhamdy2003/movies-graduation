import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie_app/core/resources/assets_manager.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/view/tabs/search/widgets/custom_search_bar.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/view/tabs/search/widgets/movies_grid_item.dart';

import '../../../cubit/search_cubit/search_cubit.dart';
import '../../../cubit/search_cubit/search_state.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.all(16),
              child: const CustomSearchBar(),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchFailure) {
                    return Center(
                      child: Text(
                        state.error,
                        style: TextStyle(color: ColorsManager.red),
                      ),
                    );
                  } else if (state is SearchSuccess) {
                    if (state.movies.isEmpty) {
                      return const Center(child: Text("No results found."));
                    }
                    return Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        itemCount: state.movies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          final movie = state.movies[index];
                          return MovieGridItem(movie: movie);
                        },
                      ),
                    );
                  } else {
                    return Center(child: Image.asset(ImageAssets.search));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
