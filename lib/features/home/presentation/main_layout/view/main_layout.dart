import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movie_app/core/resources/assets_manager.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/view/tabs/explore/explore.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/view/tabs/home/home_tab.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/view/tabs/profile/profile.dart';
import 'package:my_movie_app/features/home/presentation/main_layout/view/tabs/search/search.dart';

class MainLayOut extends StatefulWidget {
  const MainLayOut({super.key});

  @override
  State<MainLayOut> createState() => _MainLayOutState();
}

class _MainLayOutState extends State<MainLayOut> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    const HomeTab(),
    Search(),
    Explore(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          tabs[selectedIndex],
        ],
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildBottomNavBar() {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: ColorsManager.darkGrey,
            elevation: 0,
            currentIndex: selectedIndex,
            onTap: _onBottomNavBarItemClicked,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorsManager.yellow,
            unselectedItemColor: ColorsManager.white,
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
