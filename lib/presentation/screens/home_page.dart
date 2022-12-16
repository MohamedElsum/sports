import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sports/presentation/widgets/match_details.dart';
import 'package:sports/presentation/widgets/tweet_details.dart';
import 'package:sports/presentation/widgets/winner_guess.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width * 1,
              height: size.height * 0.16,
              child: Stack(
                children: [
                  Image.asset('assets/images/nav.png', fit: BoxFit.cover),
                  Positioned(
                    bottom: size.height * 0.03,
                    left: size.width * 0.42,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Latest News',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                  Text(
                    'More',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PoppinsMedium',
                      color: Color.fromRGBO(0, 112, 172, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Stack(
              children: [
                Container(
                  width: size.width * 0.95,
                  height: size.height * 0.24,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/homeimg.png',
                          width: size.width * 0.95,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: -12,
                          bottom: -17,
                          child: Image.asset(
                            'assets/images/newslogo.png',
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'Sports League',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'From Saudi stadiums to the podium of the World Cup.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Upcomin Matches',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                  Text(
                    'More',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PoppinsMedium',
                      color: Color.fromRGBO(0, 112, 172, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.21,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: const [
                  MatchDetails(),
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
                  MatchDetails(),
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
                  MatchDetails(),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Last Tweets',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                  Text(
                    'More',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PoppinsMedium',
                      color: Color.fromRGBO(0, 112, 172, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.43,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: const [
                  TweetDetails(),
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
                  TweetDetails(),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Guess who is the winner',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PoppinsRegular',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.22,
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WinnerGuess(),
                  WinnerGuess(),
                  WinnerGuess(),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Videos',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PoppinsRegular',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.3,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/video.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Sponsors',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PoppinsRegular',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.18,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/sponsor.png',
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/sponsor.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
