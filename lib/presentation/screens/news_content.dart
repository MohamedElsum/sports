import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/domain/models/news_data.dart';
import '../../controller/translation/translation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsContent extends StatefulWidget {
  NewsData newObject;

  NewsContent({
    required this.newObject,
  });

  @override
  State<NewsContent> createState() => _NewsContentState();
}

class _NewsContentState extends State<NewsContent> {
  final translationcontroller = Get.put(Translation());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var language = AppLocalizations.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    height: size.height * 0.1,
                  ),
                  Image.asset('assets/images/logo.png'),
                  Container(
                    alignment: translationcontroller.isArabic.value
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: translationcontroller.isArabic.value
                          ? Image.asset('assets/images/Icon.png')
                          : Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: Colors.white,
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
              width: size.width * 0.9,
              height: size.height * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.newObject.image.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Text(
                translationcontroller.isArabic.value
                    ? widget.newObject.titleAr.toString()
                    : widget.newObject.titleEn.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: translationcontroller.isArabic.value
                      ? 'JannatBold'
                      : 'PoppinsBold',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                translationcontroller.isArabic.value
                    ? widget.newObject.contentAr.toString()
                    : widget.newObject.contentEn.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: translationcontroller.isArabic.value
                      ? 'JannatRegular'
                      : 'PoppinsRegular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
