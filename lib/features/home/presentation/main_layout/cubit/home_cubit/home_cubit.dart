import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/error_handling.dart';
import '../../../../domain/use_case/get_movies_usecase.dart';
import '../../../../domain/use_case/get_suggestion_use_case.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetMoviesUseCase getMoviesUseCase;
  final GetSuggestionsUseCase getSuggestionsUseCase;

  HomeCubit(this.getMoviesUseCase, this.getSuggestionsUseCase)
    : super(HomeInitial());

  Future<void> fetchMovies() async {
    emit(HomeLoading());
    try {
      final movies = await getMoviesUseCase();
      final suggestions = await getSuggestionsUseCase(movies[0].id);
      emit(HomeSuccess(movies: movies, suggestions: suggestions));
    } catch (e) {
      emit(HomeFailure(Failure.handleError(e)));
    }
  }
}
