

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api_service/api_service.dart';
import '../../../../data/model/browse_movie_model.dart';

part 'browse_state.dart';

@injectable
class BrowseCubit extends Cubit<BrowseState> {
  final ApiService apiService;

  BrowseCubit(this.apiService) : super(BrowseInitial());

  Future<void> getMovies(String genre) async {
    emit(BrowseLoading());
    try {
      final movies = await apiService.getMoviesByGenre(genre);
      emit(BrowseLoaded(movies));
    } catch (e) {
      emit(BrowseError(e.toString()));
    }
  }
}

