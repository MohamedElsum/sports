import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sports/business_logic/cubit/news_cubit/news_cubit.dart';
import 'package:sports/domain/usecase/news_usecase.dart';
import 'package:sports/presentation/screens/home_screen.dart';

import 'controller/translation/translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  late NewsUsecase _newsUsecase;

  @override
  void initState() {
    super.initState();
    _newsUsecase = NewsUsecase();
  }

  @override
  Widget build(BuildContext context) {
    Translation translationController = Get.put(Translation());
    var language = AppLocalizations.of(context);

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sports',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          translationController.locale.value,
        ],
        home: BlocProvider(
          create: (BuildContext context) => NewsCubit(_newsUsecase),
          child: HomeScreen(),
        ),
      );
    });
  }
}
