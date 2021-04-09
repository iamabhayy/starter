import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:starter/configs/constants.dart';

import 'code_verification_viewmodel.dart';

class CodeVerificationView extends StatelessWidget {
 const CodeVerificationView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<CodeVerificationViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
      appBar: AppBar(elevation: 0, iconTheme: Theme.of(context).iconTheme, backgroundColor: Colors.transparent,),
      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("Code verification", style: Theme.of(context).textTheme.headline5),
              subtitle: Text.rich(
                TextSpan(
                  style: Theme.of(context).textTheme.subtitle1,
                  children: [
                    TextSpan(text: 'Enter the OTP sent to'),
                    TextSpan(
                      text: ' +91 ${model.mobileNumber}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ),
            SizedBox(height: 12.0),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              autoFocus: true,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 48,
                fieldWidth: 48,
                activeFillColor: Colors.white,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              onChanged: (value) => model.onCodeChange(value),
              appContext: context,
            ),
            SizedBox(height: 12.0),
            SizedBox(
              height: 48,
               width: double.infinity,
              child: TextButton(
                child: Text("VERIFY CODE", style: TextStyle(color: Colors.white),),
                onPressed: () => model.verifyCode(),
                style: ElevatedButton.styleFrom(primary: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    ),
     viewModelBuilder: () => CodeVerificationViewModel(),
   );
 }
}