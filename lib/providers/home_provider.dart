import 'package:chargemod/services/home_services.dart';
import 'package:flutter/cupertino.dart';

import '../models/Available_Location_model.dart';

class HomeDataProvider extends ChangeNotifier {
  LocationData? _locationData;
  List<Result> _availableLocationResult=[];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  LocationData? get locationData => _locationData;
  List<Result> get availableLocationResult => _availableLocationResult;

  updateIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<LocationData?> getAllLocation() async {
    updateIsLoading(true);
    var data = await HomeServices.getAllLocation(latitude: '8.5465282', longitude: '76.9151412');
    _locationData = LocationData.fromJson(data);
    _availableLocationResult = _locationData!.data!.result!;
    updateIsLoading(false);
    return _locationData;
  }
}
