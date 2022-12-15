import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sports/presentation/screens/league_table_page.dart';
import 'package:sports/presentation/screens/media_center_page.dart';
import 'package:sports/presentation/screens/more_page.dart';
import 'package:sports/presentation/screens/stats_page.dart';

import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List _screens = [
    HomePage(),
    LeagueTablePage(),
    MediaCenterPage(),
    StatsPage(),
    MorePage(),
  ];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      label: "Home",
      icon: SvgPicture.asset('assets/images/inactive.svg'),
      activeIcon: SvgPicture.asset('assets/images/active.svg'),
    ),
    BottomNavigationBarItem(
      label: "League Table",
      icon: SvgPicture.asset('assets/images/inactive.svg'),
      activeIcon: SvgPicture.asset('assets/images/active.svg'),
    ),
    BottomNavigationBarItem(
      label: "Media Center",
      icon: SvgPicture.asset('assets/images/inactive.svg'),
      activeIcon: SvgPicture.asset('assets/images/active.svg'),
    ),
    BottomNavigationBarItem(
      label: "Complete stats",
      icon: SvgPicture.asset('assets/images/starinactive.svg'),
      activeIcon: SvgPicture.asset('assets/images/star.svg'),
    ),
    BottomNavigationBarItem(
      label: "More",
      icon: SvgPicture.asset('assets/images/inactive.svg'),
      activeIcon: SvgPicture.asset('assets/images/active.svg'),
    ),
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color.fromRGBO(15, 23, 55, 1),
        selectedFontSize: 8,
        unselectedFontSize: 8,
        iconSize: 20,
        selectedLabelStyle: TextStyle(fontFamily: 'PoppinsMedium'),
        unselectedLabelStyle: TextStyle(fontFamily: 'PoppinsMedium'),
        items: _items,
      ),
    );
  }
}
