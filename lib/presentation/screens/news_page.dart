import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sports/domain/models/news_data.dart';
import 'package:sports/presentation/widgets/new_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/translation/translation.dart';
import 'news_content.dart';

class NewsPage extends StatefulWidget {
  final List<NewsData> newsData;

  const NewsPage({Key? key, required this.newsData}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final translationcontroller = Get.put(Translation());

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
              itemCount: widget.newsData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewsContent(
                            newObject: widget.newsData[index],
                          ),
                        ),
                      );
                    },
                    child: NewDetail(
                      news: widget.newsData[index],
                    ),
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
