import 'package:flutter/material.dart';
import 'package:sports/domain/models/news_data.dart';

class NewDetail extends StatelessWidget {
  NewsData news;

  NewDetail({
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                    left: 0,
                    child: Image.asset(
                      'assets/images/sum.png',
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
                'Sports League',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PoppinsRegular',
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                news.titleEn.toString(),
                maxLines: 3,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PoppinsBold',
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                news.createdAt.toString(),
                style: TextStyle(
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
