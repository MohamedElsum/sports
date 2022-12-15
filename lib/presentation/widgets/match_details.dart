import 'package:flutter/material.dart';

class MatchDetails extends StatelessWidget {
  const MatchDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Row(
            children: [
              Image.asset(
                'assets/images/clublogo.png',
              ),
              SizedBox(
                width: size.width*0.03,
              ),
              Text(
                'AlAhly',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text(
                '22:00',
                style: TextStyle(
                  fontFamily: 'PoppinsRegular',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Thu 15 July',
                style: TextStyle(
                  fontFamily: 'PoppinsRegular',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Image.asset(
                'assets/images/clublogo.png',
              ),
              SizedBox(
                width: size.width*0.03,
              ),
              Text(
                'AlAhly',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
