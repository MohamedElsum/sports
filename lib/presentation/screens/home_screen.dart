import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sports/business_logic/cubit/news_cubit/news_cubit.dart';
import 'package:sports/presentation/screens/league_table_page.dart';
import 'package:sports/presentation/screens/media_center_page.dart';
import 'package:sports/presentation/screens/more_page.dart';
import 'package:sports/presentation/screens/stats_page.dart';
import '../../controller/translation/translation.dart';
import 'home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final translationcontroller = Get.put(Translation());

  late NewsCubit _newsCubit;

  int _currentIndex = 0;

  List pages = [];

  @override
  void initState() {
    super.initState();
    _newsCubit = BlocProvider.of<NewsCubit>(context);
    pages = [
      HomePage(newsCubit: _newsCubit),
      const LeagueTablePage(),
      MediaCenterPage(newsCubit: _newsCubit),
      const StatsPage(),
      const MorePage(),
    ];
  }

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  List<BottomNavigationBarItem> items = [];

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        label: language!.home,
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
        label: language.leagueTable,
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
        label: language.mediaCenter,
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
        label: language.stats,
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
        label: language.more,
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
        selectedLabelStyle: TextStyle(
            fontFamily: translationcontroller.isArabic.value
                ? 'JannatBold'
                : 'PoppinsMedium'),
        unselectedLabelStyle: TextStyle(
            fontFamily: translationcontroller.isArabic.value
                ? 'JannatBold'
                : 'PoppinsMedium'),
        items: items,
      ),
    );
  }
}
