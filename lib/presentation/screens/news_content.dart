import 'package:flutter/material.dart';
import 'package:sports/domain/models/news_data.dart';

class NewsContent extends StatefulWidget {
  NewsData newObject;

  NewsContent({
    required this.newObject,
  });

  @override
  State<NewsContent> createState() => _NewsContentState();
}

class _NewsContentState extends State<NewsContent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
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
              child: Text(
                widget.newObject.titleEn.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'PoppinsBold',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.newObject.contentEn.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PoppinsRegular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
