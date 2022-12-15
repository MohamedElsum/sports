import 'package:flutter/material.dart';

class NewDetail extends StatelessWidget {
  String img;

  NewDetail({
    required this.img,
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
                  Image.asset(img),
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
                'From Saudi stadiums to the podium of the World Cup.',
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
                '12 Jul 2018',
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
