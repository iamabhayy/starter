import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';

class MobileLoginViewModel extends BaseViewModel {
  final NavigationService navigator = locator<NavigationService>();

  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'IN');
  bool? isValidate = false;

  final TextEditingController controller = TextEditingController();

  onNumberChanged(PhoneNumber number) {
    this._phoneNumber = number;
  }

  onInputValidated(bool? value) {
    this.isValidate = value;
  }

  sendVerificationCode() {
    log('verification code for ${this._phoneNumber.phoneNumber} is sent.');
    navigator.navigateTo(Routes.codeVerificationView);
  }

  PhoneNumber get number => _phoneNumber;
}
