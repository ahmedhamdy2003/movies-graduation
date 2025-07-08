import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_case/details_usecase.dart';
import '../../../../domain/use_case/get_suggestion_use_case.dart';
import 'details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final DetailsUseCase getMovieDetailsUseCase;
  final GetSuggestionsUseCase getSuggestionsUseCase;

  MovieDetailsCubit(this.getMovieDetailsUseCase, this.getSuggestionsUseCase)
    : super(MovieDetailsInitial());

  Future<void> fetchMovieDetails(int id) async {
    emit(MovieDetailsLoading());
    try {
      final movie = await getMovieDetailsUseCase(id);
      final suggestions = await getSuggestionsUseCase(id);

      emit(MovieDetailsSuccess(movie: movie, similarMovies: suggestions));
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}
