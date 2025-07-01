import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movie_app/core/resources/assets_manager.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';
import 'package:my_movie_app/features/home/tabs/explore/explore.dart';
import 'package:my_movie_app/features/home/tabs/home/home_tab.dart';
import 'package:my_movie_app/features/home/tabs/profile/profile.dart';
import '../tabs/search/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<Widget> tabs = const [
    HomeTab(),
    Search(),
    Explore(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // علشان الـ BottomNavBar يبان فوق الخلفية
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     // ImageAssets.backGround,
          //     // fit: BoxFit.cover,
          //   ),
          // ),
          tabs[selectedIndex],
        ],
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildBottomNavBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: ColorsManager.darkGrey, // لون خلفية البار
            elevation: 0,
            currentIndex: selectedIndex,
            onTap: _onBottomNavBarItemClicked,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorsManager.yellow,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(SvgAssets.selectedHomeIcon),
                icon: SvgPicture.asset(SvgAssets.homeIcon),
                label: "",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(SvgAssets.selectedSearchIcon),
                icon: SvgPicture.asset(SvgAssets.searchIcon),
                label: "",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(SvgAssets.selectedExploreIcon),
                icon: SvgPicture.asset(SvgAssets.exploreIcon),
                label: "",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(SvgAssets.selectedProfileIcon),
                icon: SvgPicture.asset(SvgAssets.profileIcon),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onBottomNavBarItemClicked(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
