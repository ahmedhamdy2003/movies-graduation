import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';

import '../../../../cubit/search_cubit/search_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();

    return TextField(
      controller: searchCubit.searchController,
      keyboardType: TextInputType.text,
      onSubmitted: (_) {
        searchCubit.search(searchCubit.searchController.text);
      },
      style: TextStyle(color: ColorsManager.white, fontSize: 14.sp),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        hintText: "Search",
        hintStyle: TextStyle(color: ColorsManager.white, fontSize: 14.sp),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
