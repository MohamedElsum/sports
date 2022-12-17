import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/business_logic/cubit/news_cubit/news_cubit.dart';
import 'package:sports/domain/usecase/news_usecase.dart';
import 'package:sports/presentation/screens/home_screen.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sports',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => NewsCubit(_newsUsecase),
        child: HomeScreen(),
      ),
    );
  }
}
