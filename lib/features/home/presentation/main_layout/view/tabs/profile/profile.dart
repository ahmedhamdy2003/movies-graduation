import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/resources/assets_manager.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';

import '../../../../../domain/entity/movie_entity.dart';
import '../../../../../profile_update/profile_update.dart';
import '../../../cubit/profile_cubit/profile_cubit.dart';
import '../../../cubit/profile_cubit/profile_state.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _currentView = 'watch';

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadProfileData();
  }

  void _navigateToUpdateProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileUpdate()),
    );

    if (result != null && result is Map<String, dynamic>) {
      context.read<ProfileCubit>().updateProfile(
        name: result['name'],
        avatar: result['avatar'],
      );
    }
  }

  void _logout() {
    context.read<ProfileCubit>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkGrey,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          List<MovieEntity> currentList = [];
          String currentName = "John Safwat";
          String currentAvatar = ImageAssets.avatar1;

          if (state is ProfileLoaded) {
            currentList =
            _currentView == 'watch' ? state.watchList : state.history;
            currentName = state.name;
            currentAvatar = state.avatar;
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(currentAvatar),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            currentName,
                            style: TextStyle(
                              color: ColorsManager.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              state is ProfileLoaded ? state.watchList.length
                                  .toString() : "0",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Watch List",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              state is ProfileLoaded ? state.history.length
                                  .toString() : "0",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "History",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: _navigateToUpdateProfile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.yellow,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                                color: ColorsManager.black,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _logout,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.lightRed,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Exit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.logout, color: ColorsManager.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentView = 'watch';
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.playlist_add_outlined,
                            size: 40,
                            color: _currentView == 'watch'
                                ? ColorsManager.yellow
                                : ColorsManager.white,
                          ),
                          const SizedBox(height: 7),
                          Text(
                            "Watch",
                            style: TextStyle(
                                color: _currentView == 'watch'
                                    ? ColorsManager.yellow
                                    : ColorsManager.white,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentView = 'history';
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.history,
                            size: 40,
                            color: _currentView == 'history'
                                ? ColorsManager.yellow
                                : ColorsManager.white,
                          ),
                          const SizedBox(height: 7),
                          Text(
                            "History",
                            style: TextStyle(
                                color: _currentView == 'history'
                                    ? ColorsManager.yellow
                                    : ColorsManager.white,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  color: ColorsManager.black,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildMovieGrid(currentList),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMovieGrid(List<MovieEntity> movies) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12)),
                      child: Image.network(
                        movie.poster,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
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
