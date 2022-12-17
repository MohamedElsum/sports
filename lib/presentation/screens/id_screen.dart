import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:sports/presentation/screens/more_page.dart';
import '../../business_logic/cubit/news_cubit/news_cubit.dart';
import '../../controller/translation/translation.dart';
import '../../domain/usecase/news_usecase.dart';
import 'home_screen.dart';

class IDScreen extends StatefulWidget {
  const IDScreen({Key? key}) : super(key: key);

  @override
  State<IDScreen> createState() => _IDScreenState();
}

class _IDScreenState extends State<IDScreen> {
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
      body: Column(
        children: [
          Container(
            width: size.width * 1,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/nav.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.096,
                ),
                Image.asset('assets/images/logo.png'),
                Container(
                  alignment: translationcontroller.isArabic.value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                      onTap: () {
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
                      child: Image.asset('assets/images/close.png')),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.25,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  language!.requestSent,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: translationcontroller.isArabic.value
                        ? 'JannatRegular'
                        : 'PoppinsRegular',
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${language.requestNum} : ',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: translationcontroller.isArabic.value
                          ? 'JannatRegular'
                          : 'PoppinsRegular',
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '12345',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: translationcontroller.isArabic.value
                          ? 'JannatRegular'
                          : 'PoppinsRegular',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Image.asset('assets/images/right.png'),
            ],
          ),
        ],
      ),
    );
  }
}
