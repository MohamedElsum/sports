import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MoreText extends StatelessWidget {
  String text;

  MoreText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'PoppinsMedium',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
