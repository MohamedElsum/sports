import 'package:flutter/material.dart';

class WinnerGuess extends StatelessWidget {
  const WinnerGuess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: size.width * 0.25,
          height: size.height * 0.09,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            'assets/images/clublogo.png',
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          'AlHilal',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'PoppinsBold',
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          '30 %',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'PoppinsRegular',
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
