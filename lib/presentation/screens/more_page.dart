import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sports/presentation/screens/contact_us.dart';
import 'package:sports/presentation/screens/home_screen.dart';
import 'package:sports/presentation/widgets/more_icons.dart';
import 'package:sports/presentation/widgets/more_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../business_logic/cubit/news_cubit/news_cubit.dart';
import '../../controller/translation/translation.dart';
import '../../domain/usecase/news_usecase.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final translationcontroller = Get.put(Translation());
  late NewsUsecase _newsUsecase;

  @override
  void initState() {
    super.initState();
    _newsUsecase = NewsUsecase();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var language = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 23, 55, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                alignment: translationcontroller.isArabic.value
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              MoreText(text: language!.clubHist),
              MoreText(text: language.fields),
              MoreText(text: language.aboutUs),
              MoreText(text: language.systems),
              MoreText(text: language.commitess),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactUs(),
                    ),
                  );
                },
                child: MoreText(text: language.contactus),
              ),
              MoreText(text: language.shareApp),
              MoreText(text: language.subscribeNews),
              InkWell(
                onTap: () {
                  translationcontroller.isArabic.value =
                      !translationcontroller.isArabic.value;
                  translationcontroller.setlanguage();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (BuildContext context) =>
                              NewsCubit(_newsUsecase),
                          child: HomeScreen(),
                        ),
                      ),
                      (route) => false);
                },
                child: MoreText(text: language.switchLang),
              ),
              MoreIcons(icon: 'assets/images/facebook.png'),
              MoreIcons(icon: 'assets/images/twitter.png'),
              MoreIcons(icon: 'assets/images/insta.png'),
              MoreIcons(icon: 'assets/images/linkedin.png'),
              MoreIcons(icon: 'assets/images/youtube.png'),
            ],
          ),
        ),
      ),
    );
  }
}
