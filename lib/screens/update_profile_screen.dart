import 'dart:developer';

import 'package:chargemod/Component/custom_text_field.dart';
import 'package:chargemod/screens/home_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../configs/constants.dart';
import '../configs/theme.dart';
import '../models/update_profile_model.dart';
import '../providers/auth_provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  final _profileFormKey = GlobalKey<FormState>();

  initData(){
    final auth = Provider.of<AuthProvider>(context, listen: false);
    log("message:${auth.user!.firstName}");
    firstNameTextController.text = "${auth.user!.firstName}";
    lastNameTextController.text = "${auth.user!.lastName}";
    emailTextController.text = "${auth.user!.email}";

  }
  @override
  void initState() {
    initData();
    super.initState();
  }
  @override
  void dispose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    emailTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
    ((MediaQuery.of(context).platformBrightness) == Brightness.dark);
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor:
      isDarkMode ? kDarkBackgroundColor : kLightBackgroundColor,
      appBar: AppBar(
        backgroundColor:
        isDarkMode ? kDarkBackgroundColor : kLightBackgroundColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(),
        centerTitle: true,
        title: Text(
          "Update Profile",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? kLightBackgroundColor : kDarkBackgroundColor,
          ),
        ),
      ),
      body: Consumer<AuthProvider>(builder: (context, auth, child) {
        return auth.isLoading?
        Center(
          child: CircularProgressIndicator(),
        )
            :SizedBox(
          height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Form(
                  key: _profileFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: firstNameTextController,
                          labelText: 'First Name',
                          hintText: 'First Name',
                        color: isDarkMode?Colors.white:Colors.black,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field can\'t be empty';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: lastNameTextController,
                          labelText: 'Last name',
                          hintText: 'Last name',
                          color:
                          isDarkMode?Colors.white:Colors.black,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field can\'t be empty';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: emailTextController,
                          labelText: 'E-mail',
                          hintText: 'email',
                        color: isDarkMode?Colors.white:Colors.black,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field can\'t be empty';
                          } else if (!regexEmailPattern
                              .hasMatch(value)) {
                            return 'Please enter correct email address';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              style:  TextStyle(color: isDarkMode?Colors.white:Colors.black,fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 16,),
                            Text(
                              "${auth.user?.mobile}",
                              style:  TextStyle(color: isDarkMode?Colors.white:Colors.black,fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Completing Your Profile",
                              style: TextStyle(color: isDarkMode?Colors.white:Colors.black,fontSize: 17,fontWeight: FontWeight.w400),textAlign: TextAlign.center,
                            ),
                            Text(
                              "This action will reflect in your activities and payments after saving. we ask\n for email details for recieving monthly activity and notifications.",
                            style: TextStyle(color: isDarkMode?Colors.white:Colors.black,fontSize: 8,fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                                width: 312,
                                child: ElevatedButton(onPressed: ()async{
                                  if(_profileFormKey.currentState!.validate()){
                                    UpdateProfileModel? updateProfileModel= await auth.updateUserDetails(firstName: firstNameTextController.text, lastName: lastNameTextController.text, email: emailTextController.text);
                                    if(updateProfileModel!.status!.contains("1")){
                                      Fluttertoast.showToast(msg: "Profile updated");
                                      Navigator.pushReplacementNamed(context, MainScreen.routeName);
                                    }
                                  }

                                }, child: Text("Save Changes",style: TextStyle(fontSize: 12),)))
                          ],
                        ),
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
