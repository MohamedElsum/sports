import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:sports/presentation/screens/complete_contact_us.dart';
import 'package:sports/presentation/widgets/text_input.dart';
import '../../controller/translation/translation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final translationcontroller = Get.put(Translation());

  TextEditingController firstnameController = TextEditingController();
  bool fisrtnameValidate = false;
  TextEditingController secondnameController = TextEditingController();
  bool secondnameValidate = false;
  TextEditingController emailController = TextEditingController();
  bool emailValidate = false;
  TextEditingController phoneNumberController = TextEditingController();
  bool phoneNumberValidate = false;

  void toastMessage(String msg) {
    showToastWidget(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 50.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Color.fromRGBO(15, 23, 55, 1),
        ),
        child: Text(
          msg,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontFamily: translationcontroller.isArabic == true
                ? 'JannatBold'
                : 'PoppinsMedium',
          ),
        ),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var language = AppLocalizations.of(context);

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
                    alignment: translationcontroller.isArabic.value
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: translationcontroller.isArabic.value
                          ? Image.asset('assets/images/Icon.png')
                          : Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: translationcontroller.isArabic.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                language!.contactus,
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
            TextInput(
              hint: language.firstName,
              validate: fisrtnameValidate,
              err: 'Error',
              controller: firstnameController,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextInput(
              hint: language.lastName,
              validate: secondnameValidate,
              err: 'Error',
              controller: secondnameController,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextInput(
              hint: language.email,
              validate: emailValidate,
              err: 'Error',
              controller: emailController,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextInput(
              hint: language.phoneNumber,
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
                  if (firstnameController.text.isEmpty) {
                    setState(() {
                      fisrtnameValidate = true;
                    });
                    toastMessage(translationcontroller.isArabic.value
                        ? 'من فضلك ادخل الاسم الاول'
                        : 'PLease Enter your First Name');
                  } else if (secondnameController.text.isEmpty) {
                    setState(() {
                      fisrtnameValidate = false;
                      secondnameValidate = true;
                    });
                    toastMessage(translationcontroller.isArabic.value
                        ? 'من فضلك ادخل الاسم الثانى'
                        : 'Please Enter your Second Name');
                  } else if (!emailController.text.contains('@')) {
                    setState(() {
                      fisrtnameValidate = false;
                      secondnameValidate = false;
                      emailValidate = true;
                    });
                    toastMessage(translationcontroller.isArabic.value
                        ? 'البريد الالكترونى غير صالح'
                        : 'This email is invalid');
                  } else if (!emailController.text.endsWith('.com')) {
                    setState(() {
                      fisrtnameValidate = false;
                      secondnameValidate = false;
                      emailValidate = true;
                    });
                    toastMessage(translationcontroller.isArabic.value
                        ? 'البريد الالكترونى غير صالح'
                        : 'This email is invalid');
                  } else if (!phoneNumberController.text.startsWith('05')) {
                    setState(() {
                      fisrtnameValidate = false;
                      secondnameValidate = false;
                      emailValidate = false;
                      phoneNumberValidate = true;
                    });
                    toastMessage(translationcontroller.isArabic.value
                        ? 'من فضلك ادخل رقم صحيح'
                        : 'Please Enter a Valid Mobile Number');
                  } else if (phoneNumberController.text.length < 10) {
                    setState(() {
                      fisrtnameValidate = false;
                      secondnameValidate = false;
                      emailValidate = false;
                      phoneNumberValidate = true;
                    });
                    toastMessage(translationcontroller.isArabic.value
                        ? 'من فضلك ادخل رقم صحيح'
                        : 'Please Enter a Valid Mobile Number');
                  } else {
                    setState(() {
                      fisrtnameValidate = false;
                      secondnameValidate = false;
                      emailValidate = false;
                      phoneNumberValidate = false;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CompleteContactUs(),
                      ),
                    );
                  }
                },
                child: Text(
                  language.next,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: translationcontroller.isArabic.value
                        ? 'JannatRegular'
                        : 'PoppinsRegular',
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
