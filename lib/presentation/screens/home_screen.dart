import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sports/business_logic/cubit/news_cubit/news_cubit.dart';
import 'package:sports/domain/models/news.dart';
import 'package:sports/presentation/screens/league_table_page.dart';
import 'package:sports/presentation/screens/media_center_page.dart';
import 'package:sports/presentation/screens/more_page.dart';
import 'package:sports/presentation/screens/stats_page.dart';

import '../../domain/models/news_data.dart';
import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsCubit _newsCubit;

  int _currentIndex = 0;

  List pages = [];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      label: "Home",
      icon: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: SvgPicture.asset('assets/images/inactive.svg'),
      ),
      activeIcon: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: SvgPicture.asset('assets/images/active.svg'),
      ),
    ),
    BottomNavigationBarItem(
      label: "League Table",
      icon: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: SvgPicture.asset('assets/images/inactive.svg'),
      ),
      activeIcon: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: SvgPicture.asset('assets/images/active.svg'),
      ),
    ),
    BottomNavigationBarItem(
      label: "Media Center",
      icon: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: SvgPicture.asset('assets/images/inactive.svg'),
      ),
      activeIcon: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: SvgPicture.asset('assets/images/active.svg'),
      ),
    ),
    BottomNavigationBarItem(
      label: "Complete stats",
      icon: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: SvgPicture.asset('assets/images/starinactive.svg'),
      ),
      activeIcon: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: SvgPicture.asset('assets/images/star.svg'),
      ),
    ),
    BottomNavigationBarItem(
      label: "More",
      icon: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: SvgPicture.asset('assets/images/inactive.svg'),
      ),
      activeIcon: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: SvgPicture.asset('assets/images/active.svg'),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _newsCubit = BlocProvider.of<NewsCubit>(context);
    pages = [
      HomePage(newsCubit: _newsCubit),
      LeagueTablePage(),
      MediaCenterPage(newsCubit: _newsCubit),
      StatsPage(),
      MorePage(),
    ];
  }

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
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
