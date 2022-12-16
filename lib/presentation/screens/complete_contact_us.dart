import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/text_input.dart';

class CompleteContactUs extends StatefulWidget {
  const CompleteContactUs({Key? key}) : super(key: key);

  @override
  State<CompleteContactUs> createState() => _CompleteContactUsState();
}

class _CompleteContactUsState extends State<CompleteContactUs> {
  TextEditingController messageTitleController = TextEditingController();
  bool messageTitleValidate = false;
  TextEditingController messageContentController = TextEditingController();
  bool messageContentValidate = false;
  String? selectedMessageType;

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
              hint: 'Message Title',
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
                  hint: const Text(
                    'Message Type',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  isExpanded: true,
                  value: selectedMessageType,
                  items: <String>['Complaint', 'Support'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
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
              hint: 'Message Content',
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
                    'Pick Images (Optional)',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsRegular',
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
                child: const Text(
                  'Send',
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
