import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'package:starter/configs/constants.dart';

import 'mobile_login_viewmodel.dart';

class MobileLoginView extends StatelessWidget {
 const MobileLoginView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<MobileLoginViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Enter your phone number",
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  "We will send you the six digit verification code",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) =>{},
                onInputValidated: (bool value) => {},
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  showFlags: false,
                  trailingSpace: false,
                  setSelectorButtonAsPrefixIcon: true
                ),
                ignoreBlank: true,
                maxLength: 10,
                hintText: '9807000000',
                autoFocus: true,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black, fontSize: 18),
                textStyle: TextStyle(color: Colors.black, fontSize: 18),
                initialValue: model.number,
                textFieldController: model.controller,
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                inputBorder: OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              SizedBox(
                height: 48,
                 width: double.infinity,
                child: TextButton(
                  child: Text("SEND VERIFICATION CODE", style: TextStyle(color: Colors.white),),
                  onPressed: () => model.sendVerificationCode(),
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
     viewModelBuilder: () => MobileLoginViewModel(),
   );
 }
}