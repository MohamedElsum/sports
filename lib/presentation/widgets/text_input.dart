import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/translation/translation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextInput extends StatelessWidget {
  String? hint;
  TextEditingController controller;
  String err;
  bool validate;

  TextInput(
      {required this.hint,
      required this.controller,
      required this.err,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    final translationcontroller = Get.put(Translation());
    var language = AppLocalizations.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: hint == language!.messContent
          ? MediaQuery.of(context).size.height * 0.2
          : MediaQuery.of(context).size.height * 0.08,
      child: TextField(
        controller: controller,
        obscuringCharacter: '*',
        maxLines: hint == language.messContent ? 8 : 1,
        obscureText: hint == 'Password'
            ? true
            : hint == 'Confirm Password'
                ? true
                : hint == 'New Password'
                    ? true
                    : hint == 'Confirm new password'
                        ? true
                        : hint == 'Old Password'
                            ? true
                            : false,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'PoppinsMedium',
          fontSize: 15,
        ),
        keyboardType: hint == 'Phone Number'
            ? TextInputType.number
            : hint == 'ex : 01013943669'
                ? TextInputType.number
                : TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          errorText: validate ? err : null,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
            fontFamily: translationcontroller.isArabic.value
                ? 'JannatRegular'
                : 'PoppinsRegular',
          ),
        ),
      ),
    );
  }
}
