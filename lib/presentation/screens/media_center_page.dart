import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:sports/presentation/screens/news_page.dart';
import 'package:sports/presentation/screens/photos_page.dart';
import 'package:sports/presentation/screens/videos_page.dart';

class MediaCenterPage extends StatefulWidget {
  const MediaCenterPage({Key? key}) : super(key: key);

  @override
  State<MediaCenterPage> createState() => _MediaCenterPageState();
}

class _MediaCenterPageState extends State<MediaCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width * 1,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/nav.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.096,
                ),
                Image.asset('assets/images/logo.png'),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Color.fromRGBO(105, 105, 105, 1),
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PoppinsBold',
                    ),
                    tabs: [
                      Tab(
                        text: 'News',
                      ),
                      Tab(
                        text: 'Photos',
                      ),
                      Tab(
                        text: 'Videos',
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
                NewsPage(),
                PhotosPage(),
                VideosPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
