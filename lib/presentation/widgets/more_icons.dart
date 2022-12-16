import 'package:flutter/material.dart';

class MoreIcons extends StatelessWidget {
  String icon;

  MoreIcons({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      alignment: Alignment.centerRight,
      child: Image.asset(icon),
    );
  }
}
