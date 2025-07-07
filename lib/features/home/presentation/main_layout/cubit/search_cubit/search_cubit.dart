import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/cubit/search_cubit/search_state.dart';

import '../../../../domain/use_case/search_usecase.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;
  final TextEditingController searchController = TextEditingController();

  SearchCubit(this._searchUseCase) : super(SearchInitial());

  void searchMovies() {
    final query = searchController.text.trim();
    if (query.isNotEmpty) {
      search(query);
    }
  }

  void search(String title) async {
    emit(SearchLoading());
    try {
      final movies = await _searchUseCase(title);
      emit(SearchSuccess(movies));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
