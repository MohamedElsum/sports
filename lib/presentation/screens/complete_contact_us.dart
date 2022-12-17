import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/translation/translation.dart';
import '../widgets/text_input.dart';

class CompleteContactUs extends StatefulWidget {
  const CompleteContactUs({Key? key}) : super(key: key);

  @override
  State<CompleteContactUs> createState() => _CompleteContactUsState();
}

class _CompleteContactUsState extends State<CompleteContactUs> {
  final translationcontroller = Get.put(Translation());

  TextEditingController messageTitleController = TextEditingController();
  bool messageTitleValidate = false;
  TextEditingController messageContentController = TextEditingController();
  bool messageContentValidate = false;
  String? selectedMessageType;

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
              hint: language.messTitle,
              validate: messageTitleValidate,
              err: 'Error',
              controller: messageTitleController,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.07,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text(
                    language.messType,
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: translationcontroller.isArabic.value
                          ? 'JannatRegular'
                          : 'PoppinsRegular',
                    ),
                  ),
                  isExpanded: true,
                  value: selectedMessageType,
                  items: <String>['Complaint', 'Support'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontFamily: translationcontroller.isArabic.value
                              ? 'JannatRegular'
                              : 'PoppinsRegular',
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(
                      () {
                        selectedMessageType = newValue;
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextInput(
              hint: language.messContent,
              controller: messageContentController,
              err: 'Error',
              validate: messageContentValidate,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.07,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    language.choosePhoto,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: translationcontroller.isArabic.value
                          ? 'JannatRegular'
                          : 'PoppinsRegular',
                      color: Colors.grey,
                    ),
                  ),
                  Image.asset('assets/images/cam.png'),
                ],
              ),
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
                onPressed: () {},
                child: Text(
                  language.send,
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
