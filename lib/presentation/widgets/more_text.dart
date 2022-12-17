import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/translation/translation.dart';

class MoreText extends StatelessWidget {
  String text;

  MoreText({
    required this.text,
  });

  final translationcontroller = Get.put(Translation());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      alignment: translationcontroller.isArabic.value
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: translationcontroller.isArabic.value
              ? 'JannatBold'
              : 'PoppinsMedium',
          fontSize: MediaQuery.of(context).size.height * 0.023,
          color: Colors.white,
        ),
      ),
    );
  }
}
