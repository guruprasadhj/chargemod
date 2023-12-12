import 'dart:developer';

import 'networking.dart';

class HomeServices{
  static final networking = Networking();
  
  static Future<Map<String,dynamic>> getAllLocation({required String latitude,required String longitude})async{
    var data = await networking.getRequest(endpoint: '/$latitude/$longitude/all-locations?limit=10&page=1');
    log("getAllLocation$data");
    return data;
  }

}