import 'package:flutter/material.dart';
import 'package:sports/presentation/widgets/more_icons.dart';
import 'package:sports/presentation/widgets/more_text.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 23, 55, 1),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            MoreText(text: 'Clubs Directory'),
            MoreText(text: 'Stadium Directory'),
            MoreText(text: 'About Us'),
            MoreText(text: 'Regulations and Systems'),
            MoreText(text: 'Committees'),
            MoreText(text: 'Contact Us'),
            MoreText(text: 'Share the app'),
            MoreText(text: 'Subscribe to the newsletter'),
            MoreText(text: 'Switch Language'),
            MoreIcons(icon: 'assets/images/facebook.png'),
            MoreIcons(icon: 'assets/images/twitter.png'),
            MoreIcons(icon: 'assets/images/insta.png'),
            MoreIcons(icon: 'assets/images/linkedin.png'),
            MoreIcons(icon: 'assets/images/youtube.png'),
          ],
        ),
      ),
    );
  }
}
