import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/cubit/profile_cubit/profile_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../domain/use_case/get_history_usecase.dart';
import '../../../../domain/use_case/get_watch_list_usecase.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final SharedPreferences sharedPreferences;
  final GetWatchList getWatchList;
  final GetHistory getHistory;

  ProfileCubit(this.getWatchList, this.sharedPreferences, this.getHistory)
    : super(ProfileInitial());

  void loadProfileData() async {
    emit(ProfileLoading());

    try {
      final watchList = await getWatchList();
      final history = await getHistory();
      final name = sharedPreferences.getString('user_name') ?? 'John Safwat';
      final avatar =
          sharedPreferences.getString('user_avatar') ?? ImageAssets.avatar1;

      emit(
        ProfileLoaded(
          watchList: watchList,
          history: history,
          name: name,
          avatar: avatar,
        ),
      );
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  void updateProfile({required String name, required String avatar}) {
    sharedPreferences.setString('user_name', name);
    sharedPreferences.setString('user_avatar', avatar);

    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      emit(
        ProfileLoaded(
          watchList: currentState.watchList,
          history: currentState.history,
          name: name,
          avatar: avatar,
        ),
      );
    }
  }

  void logout() {
    sharedPreferences.remove('user_name');
    sharedPreferences.remove('user_avatar');
    emit(ProfileInitial());
  }
}
