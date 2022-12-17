import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/translation/translation.dart';

class MatchDetails extends StatefulWidget {
  const MatchDetails({Key? key}) : super(key: key);

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  final translationcontroller = Get.put(Translation());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var language = AppLocalizations.of(context);

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
                width: size.width * 0.03,
              ),
              Text(
                language!.alahly,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: translationcontroller.isArabic.value
                      ? 'JannatBold'
                      : 'PoppinsMedium',
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              const Text(
                '22:00',
                style: TextStyle(
                  fontFamily: 'PoppinsRegular',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                language.matchDate,
                style: TextStyle(
                  fontFamily: translationcontroller.isArabic.value
                      ? 'JannatRegular'
                      : 'PoppinsRegular',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/clublogo.png',
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              language!.alahly,
              style: TextStyle(
                fontSize: 14,
                fontFamily: translationcontroller.isArabic.value
                    ? 'JannatBold'
                    : 'PoppinsMedium',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
