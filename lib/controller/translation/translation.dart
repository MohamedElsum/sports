import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Translation extends GetxController {
  var isArabic = false.obs;
  var lang = "Arabic".obs;
  var textDirection = TextDirection.ltr.obs;
  var locale = const Locale(
    'en',
  ).obs;

  void setlanguage() {
    if (isArabic.value) {
      setLocale(const Locale.fromSubtags(
        languageCode: 'ar',
      ));
      textDirection.value = TextDirection.rtl;
      Get.updateLocale(locale.value);
    } else if (!isArabic.value) {
      setLocale(const Locale.fromSubtags(languageCode: 'en'));
      textDirection.value = TextDirection.ltr;
      Get.updateLocale(locale.value);
    }
  }

  //Locale  locale;

  void setLocale(Locale value) {
    locale.value = value;
  }
}
