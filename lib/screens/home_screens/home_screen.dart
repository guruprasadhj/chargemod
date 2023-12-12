import 'package:chargemod/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController(viewportFraction: 0.8);
initData(){
  final home = Provider.of<HomeDataProvider>(context, listen: false);
  home.getAllLocation();
}
  @override
  void initState() {
    initData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeDataProvider>(builder: (context, home, child) {
          return home.isLoading?
          Center(
            child: CircularProgressIndicator(),
          )
              :Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // color: Colors.lightBlue,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/map-placeholder.png"),
                        fit: BoxFit.fill)),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  height: 50.h, // Card height
                  child: PageView.builder(
                    itemCount: home.availableLocationResult.length,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0,top: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${home.availableLocationResult[index].name}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              Text("${home.availableLocationResult[index].street1}, ${home.availableLocationResult[index].street2}, ${home.availableLocationResult[index].city}",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
