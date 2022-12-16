import 'package:flutter/material.dart';
import 'package:sports/presentation/screens/complete_contact_us.dart';
import 'package:sports/presentation/widgets/text_input.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController firstnameController = TextEditingController();
  bool fisrtnameValidate = false;
  TextEditingController secondnameController = TextEditingController();
  bool secondnameValidate = false;
  TextEditingController emailController = TextEditingController();
  bool emailValidate = false;
  TextEditingController phoneNumberController = TextEditingController();
  bool phoneNumberValidate = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      body: SingleChildScrollView(
        child: Column(
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
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'PoppinsRegular',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextInput(
              hint: 'First Name',
              validate: fisrtnameValidate,
              err: 'Error',
              controller: firstnameController,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextInput(
              hint: 'Second Name',
              validate: secondnameValidate,
              err: 'Error',
              controller: secondnameController,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextInput(
              hint: 'Email Address',
              validate: emailValidate,
              err: 'Error',
              controller: emailController,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextInput(
              hint: 'Phone Number',
              validate: phoneNumberValidate,
              err: 'Error',
              controller: phoneNumberController,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(15, 23, 55, 1),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CompleteContactUs(),
                    ),
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PoppinsRegular',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
