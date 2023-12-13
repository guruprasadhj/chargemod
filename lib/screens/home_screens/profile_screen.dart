import 'package:chargemod/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../configs/theme.dart';
import '../../providers/auth_provider.dart';
import '../update_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {

    bool isDarkMode =
    ((MediaQuery.of(context).platformBrightness) == Brightness.dark);
    return Scaffold(
      backgroundColor:
      isDarkMode ? kDarkBackgroundColor : kLightBackgroundColor,
      body: Consumer<AuthProvider>(builder: (context, auth, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: kLightGreyColor),
                            ),
                            Text("${auth.user?.firstName} ${auth.user?.lastName}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: isDarkMode? Colors.white:Colors.black
                              ),),

                            Container(
                              width: 312,
                              height: 131,
                              padding: EdgeInsets.all(19),
                              margin: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/graphics.png",
                                    ),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                  ),
                                ],
                                // color: Colors.red,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Energy Balance ",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "99999 kWH",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: kDarkBackgroundColor),
                                      ),
                                      Text(
                                        "Added 100 kWH on 20/11/2022",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width: 125,
                                        height: 24,
                                        child: ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: Icon(Icons.add),
                                            label: Text(
                                              "Add Energy",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                            )),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: SizedBox(
                                          width: 62,
                                          height: 54,
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                  width: 54,
                                                  height: 54,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    color: Color(0xff007AFF),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset: Offset(0, 2),
                                                        color: Colors.grey,
                                                        blurRadius: 2.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomCenter,
                                                child: Container(
                                                  width: 62,
                                                  height: 12,
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(bottom: 11),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff2538DB),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset: Offset(0, 2),
                                                        color: Color(0xff00000040),
                                                        blurRadius: 2.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Text("Badge Name",style: TextStyle(fontSize:5,color: Colors.white),),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 121,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: kDarkBackgroundColor)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.album_rounded,color: Color(0xffE9852A),),
                                            SizedBox(width: 5,),
                                            Text(
                                              "55 Points",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 19,vertical: 12),
                              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2.0,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading:SvgPicture.asset("assets/svg/payment-icon.svg",height: 39,),
                                    title: Text("My Payments"),
                                    trailing: Icon(Icons.chevron_right),
                                  ),Divider(color: Color(0xff666766),),
                                  ListTile(
                                    leading:SvgPicture.asset("assets/svg/bike-icon.svg",height: 39,),
                                    title: Text("My Electric Vehicles"),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                  Divider(color: Color(0xff666766),),
                                  ListTile(
                                    leading:SvgPicture.asset("assets/svg/love-icon.svg",height: 39,),
                                    title: Text("My Favourite Stations"),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: SizedBox(
                                width: 312,
                                height: 38,
                                child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen()));
                                    // final auth = Provider.of<AuthProvider>(context, listen: false);
                                    // auth.getUserDetails();
                                  },
                                  child: const Text("Buy Machines From chargeMOD"),
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 19,vertical: 12),
                              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2.0,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading:SvgPicture.asset("assets/svg/mydevice-icon.svg",height: 39,),
                                    title: Text("My Devices"),
                                    trailing: Icon(Icons.chevron_right),
                                  ),Divider(color: Color(0xff666766),),
                                  ListTile(
                                    leading:SvgPicture.asset("assets/svg/myorders.svg",height: 39,),
                                    title: Text("My Orders"),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 19,vertical: 12),
                              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2.0,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading:SvgPicture.asset("assets/svg/mydevice-icon.svg",height: 39,),
                                    title: Text("Help"),
                                    trailing: Icon(Icons.chevron_right),
                                  ),Divider(color: Color(0xff666766),),
                                  ListTile(
                                    leading:SvgPicture.asset("assets/svg/bike-icon.svg",height: 39,),
                                    title: Text("Raise Complaint"),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                  Divider(color: Color(0xff666766),),
                                  ListTile(
                                    leading:SvgPicture.asset("assets/svg/bike-icon.svg",height: 39,),
                                    title: Text("About Us"),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                  Divider(color: Color(0xff666766),),
                                  ListTile(
                                    leading:SvgPicture.asset("assets/svg/privacy-icon.svg",height: 39,),
                                    title: Text("Privacy Policy"),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: SizedBox(
                                width: 312,
                                height: 38,
                                child: ElevatedButton(
                                  onPressed: (){
                                    showDialog(context: context, builder: (context){
                                      return AlertDialog(
                                          title: Text("logout"),
                                          content: Container(
                                            height: 100,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("do you really want to logout?"),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    ElevatedButton(
                                                      child: Text("cancel"),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    ElevatedButton(
                                                      child: const Text("logout"),
                                                      onPressed: ()async{
                                                        final navigator= Navigator.of(context);
                                                       await AuthProvider.logOut();
                                                       navigator.pop();
                                                       navigator.pushReplacementNamed(SplashScreen.routeName);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                      );
                                    });
                                  },
                                  child: const Text("Logout"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/COPYRIGHT.png",height: 107,width: 180,),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        }
      ),
    );
  }

}
class EnergyBalanceCard extends StatelessWidget {
  const EnergyBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
