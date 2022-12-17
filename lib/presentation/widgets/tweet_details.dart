import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/translation/translation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TweetDetails extends StatefulWidget {
  const TweetDetails({Key? key}) : super(key: key);

  @override
  State<TweetDetails> createState() => _TweetDetailsState();
}

class _TweetDetailsState extends State<TweetDetails> {
  final translationcontroller = Get.put(Translation());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var language = AppLocalizations.of(context);

    return Column(
      children: [
        ListTile(
          leading: Image.asset('assets/images/logo.png'),
          title: Text(
            language!.sportsleague,
            style: TextStyle(
              fontFamily: translationcontroller.isArabic.value
                  ? 'JannatBold'
                  : 'PoppinsBold',
              fontSize: 16,
            ),
          ),
          subtitle: const Text(
            '@account',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'PoppinsRegular',
            ),
          ),
        ),
        Container(
          child: Text(
            language.tweetContent,
            style: TextStyle(
              fontSize: 12,
              fontFamily: translationcontroller.isArabic.value
                  ? 'JannatRegular'
                  : 'PoppinsRegular',
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
      ],
    );
  }
}
