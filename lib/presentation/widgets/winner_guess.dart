import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/translation/translation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WinnerGuess extends StatefulWidget {
  String clubName;

  WinnerGuess({
    required this.clubName,
  });

  @override
  State<WinnerGuess> createState() => _WinnerGuessState();
}

class _WinnerGuessState extends State<WinnerGuess> {
  final translationcontroller = Get.put(Translation());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var language = AppLocalizations.of(context);

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
          widget.clubName,
          style: TextStyle(
            fontSize: 16,
            fontFamily: translationcontroller.isArabic.value
                ? 'JannatBold'
                : 'PoppinsBold',
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        const Text(
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
