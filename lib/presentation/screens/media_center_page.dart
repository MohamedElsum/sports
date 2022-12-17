import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sports/business_logic/cubit/news_cubit/news_cubit.dart';
import 'package:sports/presentation/screens/news_page.dart';
import 'package:sports/presentation/screens/photos_page.dart';
import 'package:sports/presentation/screens/videos_page.dart';
import '../../controller/translation/translation.dart';

class MediaCenterPage extends StatefulWidget {
  NewsCubit newsCubit;

  MediaCenterPage({
    required this.newsCubit,
  });

  @override
  State<MediaCenterPage> createState() => _MediaCenterPageState();
}

class _MediaCenterPageState extends State<MediaCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final translationcontroller = Get.put(Translation());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var language = AppLocalizations.of(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width * 1,
            height: size.height * 0.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/nav.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: size.height * 0.081,
                ),
                Image.asset('assets/images/logo.png'),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor:
                        const Color.fromRGBO(105, 105, 105, 1),
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: translationcontroller.isArabic.value
                          ? 'JannatBold'
                          : 'PoppinsBold',
                    ),
                    tabs: [
                      Tab(
                        text: language!.news,
                      ),
                      Tab(
                        text: language.photos,
                      ),
                      Tab(
                        text: language.videos,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                NewsPage(
                  newsData: widget.newsCubit.newsResponse,
                ),
                const PhotosPage(),
                const VideosPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
