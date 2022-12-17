import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sports/business_logic/cubit/news_cubit/news_state.dart';
import 'package:sports/presentation/widgets/match_details.dart';
import 'package:sports/presentation/widgets/tweet_details.dart';
import 'package:sports/presentation/widgets/winner_guess.dart';
import '../../business_logic/cubit/news_cubit/news_cubit.dart';
import '../../controller/translation/translation.dart';
import '../../domain/models/news_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  final NewsCubit newsCubit;

  const HomePage({Key? key, required this.newsCubit}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final translationcontroller = Get.put(Translation());

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await widget.newsCubit.getNews();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
          body: buildBlocWidget(state, size),
        );
      },
    );
  }

  Widget buildBlocWidget(state, size) {
    if (state is NewsLoading) {
      return Container(
        color: Colors.black12,
        child: const Center(
          child: CircularProgressIndicator(
            color: Color.fromRGBO(15, 23, 55, 1),
          ),
        ),
      );
    } else if (state is NewsSuccess) {
      return buildBodyWidget(size, state.newsResponse);
    } else {
      return const Text('Nothing');
    }
  }

  Widget buildBodyWidget(Size size, List<NewsData> newss) {
    var language = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: size.width * 1,
            height: size.height * 0.16,
            child: Stack(
              children: [
                Image.asset('assets/images/nav.png', fit: BoxFit.cover),
                Positioned(
                  bottom: size.height * 0.03,
                  left: size.width * 0.42,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  language!.latestNews,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: translationcontroller.isArabic.value
                        ? 'JannatRegular'
                        : 'PoppinsRegular',
                  ),
                ),
                Text(
                  language.more,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: translationcontroller.isArabic.value
                        ? 'JannatBold'
                        : 'PoppinsMedium',
                    color: const Color.fromRGBO(0, 112, 172, 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Stack(
            children: [
              Container(
                width: size.width * 0.95,
                height: size.height * 0.24,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Image.network(
                        newss[0].image.toString(),
                        width: size.width * 0.95,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: translationcontroller.isArabic.value
                            ? size.width * -0.03
                            : size.width * 0.78,
                        bottom: translationcontroller.isArabic.value
                            ? size.height * -0.025
                            : size.height * -0.024,
                        child: Image.asset(
                          translationcontroller.isArabic.value
                              ? 'assets/images/newslogo.png'
                              : 'assets/images/sum.png',
                          width: size.width * 0.2,
                          height: size.height * 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            alignment: translationcontroller.isArabic.value
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              language.sportsleague,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: translationcontroller.isArabic.value
                    ? 'JannatBold'
                    : 'PoppinsMedium',
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.004,
          ),
          Container(
            alignment: translationcontroller.isArabic.value
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              translationcontroller.isArabic.value
                  ? newss[0].titleAr.toString()
                  : newss[0].titleEn.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: translationcontroller.isArabic.value ? 14 : 13,
                fontFamily: translationcontroller.isArabic.value
                    ? 'JannatBold'
                    : 'PoppinsMedium',
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  language.upcomingMatches,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: translationcontroller.isArabic.value
                        ? 'JannatRegular'
                        : 'PoppinsRegular',
                  ),
                ),
                Text(
                  language.more,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: translationcontroller.isArabic.value
                        ? 'JannatBold'
                        : 'PoppinsMedium',
                    color: const Color.fromRGBO(0, 112, 172, 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: double.infinity,
            height: translationcontroller.isArabic.value
                ? size.height * 0.23
                : size.height * 0.21,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: const [
                MatchDetails(),
                SizedBox(
                  width: double.infinity,
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),
                MatchDetails(),
                SizedBox(
                  width: double.infinity,
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),
                MatchDetails(),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  language.lastTweets,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: translationcontroller.isArabic.value
                        ? 'JannatRegular'
                        : 'PoppinsRegular',
                  ),
                ),
                Text(
                  language.more,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: translationcontroller.isArabic.value
                        ? 'JannatBold'
                        : 'PoppinsMedium',
                    color: const Color.fromRGBO(0, 112, 172, 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: double.infinity,
            height: translationcontroller.isArabic.value
                ? size.height * 0.45
                : size.height * 0.43,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: const [
                TweetDetails(),
                SizedBox(
                  width: double.infinity,
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),
                TweetDetails(),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            alignment: translationcontroller.isArabic.value
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              language.guess,
              style: TextStyle(
                fontSize: 16,
                fontFamily: translationcontroller.isArabic.value
                    ? 'JannatRegular'
                    : 'PoppinsRegular',
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.22,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WinnerGuess(
                  clubName: language.alhilal,
                ),
                WinnerGuess(
                  clubName: language.alithad,
                ),
                WinnerGuess(
                  clubName: language.alnahda,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            alignment: translationcontroller.isArabic.value
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              language.videos,
              style: TextStyle(
                fontSize: 16,
                fontFamily: translationcontroller.isArabic.value
                    ? 'JannatRegular'
                    : 'PoppinsRegular',
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.3,
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/video.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            alignment: translationcontroller.isArabic.value
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              language.sponsor,
              style: TextStyle(
                fontSize: 16,
                fontFamily: translationcontroller.isArabic.value
                    ? 'JannatRegular'
                    : 'PoppinsRegular',
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.18,
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/sponsor.png',
                ),
                Image.asset(
                  'assets/images/sponsor.png',
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
