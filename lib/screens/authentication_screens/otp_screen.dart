import 'dart:async';

import 'package:chargemod/models/auth_verify_model.dart';
import 'package:chargemod/screens/authentication_screens/update_profile.dart';
import 'package:chargemod/screens/error_screen.dart';
import 'package:chargemod/screens/home_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../configs/theme.dart';
import '../../providers/auth_provider.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName = '/otp_screen';

  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;
  int otp=0;
  // TextEditingController otpTextController = TextEditingController();


  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
    super.initState();
  }
verify(int otp)async{
    final navigator = Navigator.of(context);
    final auth = Provider.of<AuthProvider>(context, listen: false);
    AuthVerifyModel? verification = await auth.verifyOTP(otp: (otp));
    if(verification!.data!.isNewUser==true){
      navigator.pushReplacementNamed(UpdateProfile.routeName);
    }
    else if(verification.data!.isNewUser==false){
      navigator.pushReplacementNamed( MainScreen.routeName);
    }
    else{
      navigator.pushReplacementNamed(ErrorScreen.routeName);
    }
    // if(verification!=null){
    //   var data =  await auth.getUserDetails();
    // }
  }
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        ((MediaQuery.of(context).platformBrightness) == Brightness.dark);
    return Scaffold(
      backgroundColor:
          isDarkMode ? kDarkBackgroundColor : kLightBackgroundColor,
      appBar: AppBar(
        backgroundColor:
            isDarkMode ? kDarkBackgroundColor : kLightBackgroundColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(),
        centerTitle: true,
        title: Text(
          "Verification",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: isDarkMode ? kLightBackgroundColor : kDarkBackgroundColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? kLightBackgroundColor : kDarkBackgroundColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<AuthProvider>(builder: (context, auth, child) {
        return auth.isLoading?
            Center(
              child: CircularProgressIndicator(),
            )
           :Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Text(
                        "We’ve send you the verification \ncode on +91 ${auth.phoneNumber}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: isDarkMode
                              ? kLightBackgroundColor
                              : kDarkBackgroundColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                PinCodeFields(
                  length: 4,
                  fieldBorderStyle: FieldBorderStyle.square,
                  responsive: false,
                  fieldHeight: 55.0,
                  fieldWidth: 55.0,
                  borderWidth: 1.0,
                  activeBorderColor: kOutlineColor,
                  activeBackgroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  keyboardType: TextInputType.number,
                  autoHideKeyboard: false,
                  fieldBackgroundColor: Colors.white,
                  borderColor: Colors.black38,
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  onComplete: (output) {
                    // Your logic with pin code
                    print(output);
                    otp = int.parse(output);
                    verify(otp);
                  },

                ),
                enableResend ?TextButton(
                  child: Text('Resend OTP',style: TextStyle(color: kPrimaryColor,fontSize: 15,fontWeight: FontWeight.w400),),
                  onPressed:  _resendCode
                ):
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Re-send code in ',
                        style: TextStyle(color: isDarkMode
                            ? kLightBackgroundColor
                            : kDarkBackgroundColor, fontSize: 15),
                      ),
                      TextSpan(
                        text: '0:${secondsRemaining>9?secondsRemaining:"0$secondsRemaining"}',
                        style: TextStyle(color: kPrimaryColor, fontSize: 15),
                      ),
                    ]
                  ),
                ),
                Spacer(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: SizedBox(
                        width: 273.w,
                        height: 43.h,
                        child: ElevatedButton(
                            onPressed: () {
                              if(otp !=0){
                                verify(otp);
                              }
                            },
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ))),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
  void _resendCode() {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    auth.resendOTP();
    setState((){
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose(){
    timer.cancel();
    super.dispose();
  }
}
