import 'package:flutter/material.dart';

class TweetDetails extends StatelessWidget {
  const TweetDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        ListTile(
          leading: Image.asset('assets/images/logo.png'),
          title: const Text(
            'Sports League',
            style: TextStyle(
              fontFamily: 'PoppinsBold',
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
          child: const Text(
            'When the world wants to speak, it speaks in Unicode. Register now to attend the Tenth International Unicode Conference, to be held on March 10-12, 1997 in Mainz, Germany.',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'PoppinsRegular',
            ),
          ),
        ),
        SizedBox(
          height: size.height*0.02,
        ),
      ],
    );
  }
}
