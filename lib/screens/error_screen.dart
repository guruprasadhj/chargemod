import 'package:chargemod/configs/theme.dart';
import 'package:chargemod/screens/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static const String routeName = '/error_screen';

  const ErrorScreen({super.key});
  final String errorMsg='Something Went Wrong!';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.warning_rounded,size: 230,color: kPrimaryColor,),
            Text(errorMsg),
            Padding(
              padding: EdgeInsets.all(8.0),
                // width: 70,height: 30,
                child: ElevatedButton.icon(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                },label: Text('data',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),), icon: Icon(Icons.refresh), ))
          ],
        ),
      ),
    );
  }
}
