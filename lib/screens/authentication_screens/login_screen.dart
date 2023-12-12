
import 'dart:developer';

import 'package:chargemod/Component/inline_text_button.dart';
import 'package:chargemod/Component/there_line_banner.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../configs/theme.dart';
import '../../providers/auth_provider.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  late final FlCountryCodePicker countryPicker;
  TextEditingController phoneTextController = TextEditingController();
  CountryCode? countryCode;

  bool hasMaxLengthError = false;

  final countryTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

@override
  void initState() {
    super.initState();
    countryCode = CountryCode.fromName('India');

    phoneTextController = TextEditingController()
      ..addListener(() {
        if (countryCode != null &&
            countryCode!.nationalSignificantNumber != null) {
          if (phoneTextController.text.length !=
              countryCode!.nationalSignificantNumber!) {
            hasMaxLengthError = true;
          } else {
            hasMaxLengthError = false;
          }

          setState(() {});
        }
      });

    countryPicker = const FlCountryCodePicker(
      countryTextStyle: TextStyle(
        color: Colors.red,
        fontSize: 16,
      ),
      dialCodeTextStyle: TextStyle(color: Colors.green, fontSize: 16),
    );
  }
  @override
  void dispose() {
    phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = ((MediaQuery.of(context).platformBrightness) == Brightness.dark);
    return Scaffold(
      backgroundColor: isDarkMode?kDarkBackgroundColor:kLightBackgroundColor,
      body: Consumer<AuthProvider>(builder: (context, auth, child) {
        return auth.isLoading?
            Center(
              child: CircularProgressIndicator(),
            )
           :SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:83.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start  ,
                        children: [
                          ThreeLineBanner(firstLine: "ChargeMOD", secondLine: "Let's Strat", thirdLine: "From Login", textColor:isDarkMode?kLightBackgroundColor:kDarkBackgroundColor ),
                          Padding(
                            padding: EdgeInsets.only(top: 40,bottom: 11),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: 40,maxWidth: 290,
                                  minHeight: 38,minWidth: 289
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: ()async  {
                                      final code = await countryPicker.showPicker(
                                        context: context,
                                        scrollToDeviceLocale: true,
                                      );
                                      if (code != null) {
                                        setState(() => countryCode = code);
                                        countryTextController.text = code.name;
                                      }
                                    },
                                    child: Container(
                                      width: 66,
                                      height: 40,
                                      // padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: kOutlineColor),
                                        borderRadius: BorderRadius.circular(8.0),
                                        color: Colors.white
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          if(countryCode != null) countryCode!.flagImage(width:32),
                                          const Icon(Icons.keyboard_arrow_down_rounded)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(bottom: 8),
                                      // margin: EdgeInsets.only(left: 10, right: 10),
                                      height: 40,
                                      width: 220.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kOutlineColor),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)),
                                      child:  TextFormField(
                                        controller: phoneTextController,
                                        keyboardType: TextInputType.phone,
                                        style: const TextStyle(fontSize: 17),
                                        textAlignVertical: TextAlignVertical.center,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            Fluttertoast.showToast(msg: 'Enter phone number');
                                            return 'Enter email address';
                                          }
                                          if("${countryCode?.name}"=="India"){
                                            if(phoneTextController.text.length==10){
                                              return null;
                                            }else{
                                              return '10 digit allowed for India Number';
                                            }
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon:  Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.phone_outlined),
                                          ),
                                          hintText: 'Enter phone number',
                                          hintStyle: TextStyle(color: kLightGreyHintTextColor,fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          ConstrainedBox(
                              // width: double.infinity,
                              constraints: const BoxConstraints(
                                maxHeight: 40,maxWidth: 290,
                                minHeight: 38,minWidth: 289
                              ),
                              child: ElevatedButton(onPressed: ()async{
                                if(_formKey.currentState!.validate()){
                                if(phoneTextController.text.isNotEmpty){
                                  String countryName ="${countryCode?.name}";
                                  if(countryName=="India"){
                                    var data = await auth.sendOTP(phone: int.parse(phoneTextController.text));
                                    if(data["data"]=="ok"){
                                      Navigator.pushNamed(context, OtpScreen.routeName);
                                    }

                                  }else{
                                    Fluttertoast.showToast(msg: 'Sorry for you inconvience.\nwe don\'t have service in $countryName' );
                                  }
                                  
                                }
                                }

                              }, child: const Text("Sent OTP",style: TextStyle(fontSize: 16,),)))
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('By Continuing you agree to our'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InlineTextButton(text: "Terms and Conditions", onTap: (){}),
                            const Text(' and '),
                            InlineTextButton(text: "Privacy Policy", onTap: (){}),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
