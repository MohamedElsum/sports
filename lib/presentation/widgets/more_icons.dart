import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/translation/translation.dart';

class MoreIcons extends StatelessWidget {
  String icon;

  MoreIcons({
    required this.icon,
  });

  final translationcontroller = Get.put(Translation());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      alignment: translationcontroller.isArabic.value
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Image.asset(icon),
    );
  }
}
