
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/domain/models/news_data.dart';
import '../../controller/translation/translation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewDetail extends StatelessWidget {
  NewsData news;

  NewDetail({
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final translationcontroller = Get.put(Translation());
    var language = AppLocalizations.of(context);

    return Row(
      children: [
        Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.network(
                    news.image.toString(),
                    width: size.width * 0.35,
                    height: size.height * 0.15,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: translationcontroller.isArabic.value
                        ? size.width * 0.259
                        : size.width * 0.00,
                    child: Image.asset(
                      translationcontroller.isArabic.value
                          ? 'assets/images/newslogo.png'
                          : 'assets/images/sum.png',
                      width: size.width * 0.1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                language!.sportsleague,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: translationcontroller.isArabic.value
                      ? 'JannatRegular'
                      : 'PoppinsRegular',
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                translationcontroller.isArabic.value
                    ? news.titleAr.toString()
                    : news.titleEn.toString(),
                maxLines: 3,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: translationcontroller.isArabic.value
                      ? 'JannatBold'
                      : 'PoppinsBold',
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                news.createdAt.toString(),
                style: const TextStyle(
                  fontSize: 11,
                  fontFamily: 'PoppinsRegular',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
