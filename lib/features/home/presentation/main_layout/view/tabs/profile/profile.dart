import 'package:flutter/material.dart';
import 'package:my_movie_app/core/resources/assets_manager.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _currentView = 'watch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkGrey,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
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
                          backgroundImage: AssetImage(ImageAssets.avatar1),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "John Safwat",
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
                        children: const [
                          Text(
                            "12",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
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
                        children: const [
                          Text(
                            "10",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
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
                        onPressed: () {},
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
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.lightRed,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Exit",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Toggle between Watch and History
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
                          color:
                              _currentView == 'watch'
                                  ? ColorsManager.yellow
                                  : ColorsManager.white,
                        ),
                        const SizedBox(height: 7),
                        Text(
                          "Watch",
                          style: TextStyle(
                            color:
                                _currentView == 'watch'
                                    ? ColorsManager.yellow
                                    : ColorsManager.white,
                            fontSize: 16,
                          ),
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
                          color:
                              _currentView == 'history'
                                  ? ColorsManager.yellow
                                  : ColorsManager.white,
                        ),
                        const SizedBox(height: 7),
                        Text(
                          "History",
                          style: TextStyle(
                            color:
                                _currentView == 'history'
                                    ? ColorsManager.yellow
                                    : ColorsManager.white,
                            fontSize: 16,
                          ),
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
                  children: [const SizedBox(height: 16), _buildMovieGrid()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieGrid() {
    List<String> movieImages = List.filled(
      12,
      ImageAssets.film1,
    ); // 12 example movies

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: movieImages.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(movieImages[index], fit: BoxFit.cover),
        );
      },
    );
  }
}
