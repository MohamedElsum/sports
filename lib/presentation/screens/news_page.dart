import 'package:flutter/material.dart';
import 'package:sports/presentation/widgets/new_details.dart';

import '../../models/news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<News> news = [
    News(
      img: 'assets/images/new1.png',
    ),
    News(
      img: 'assets/images/new2.png',
    ),
    News(
      img: 'assets/images/new3.png',
    ),
    News(
      img: 'assets/images/new4.png',
    ),
    News(
      img: 'assets/images/new1.png',
    ),
    News(
      img: 'assets/images/new2.png',
    ),
    News(
      img: 'assets/images/new1.png',
    ),
    News(
      img: 'assets/images/new2.png',
    ),
    News(
      img: 'assets/images/new3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: size.width * 0.94,
            height: size.height * 0.73,
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: NewDetail(
                    img: news[index].img,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
