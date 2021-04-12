import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/services/mobile_auth.dart';

class MobileLoginViewModel extends BaseViewModel {
  final MobileAuth mauth = locator<MobileAuth>();

  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'IN');
  bool? isValidate = false;

  final TextEditingController controller = TextEditingController();

  sendVerificationCode() async {
    try {
      log(this.controller.text);
      mauth.phoneNumber = this.controller.text;
      await mauth.verifyPhoneNumber();
    } catch (e) {
      log(e.toString());
    }
  }

  PhoneNumber get number => _phoneNumber;
}
