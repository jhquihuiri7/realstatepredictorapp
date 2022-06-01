import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final labelProvider = ChangeNotifierProvider((_)=>LabelProvider());



class LabelProvider extends ChangeNotifier {

  double _garageCapacity = 2.0;
  double get garageCapacity => _garageCapacity;
  set garageCapacity (value){
    _garageCapacity = value;
    notifyListeners();
  }
  double _quality = 2.0;
  double get quality => _quality;
  set quality (value){
    _quality = value;
    notifyListeners();
  }
  int _yearGarage = 2022;
  int get yearGarage => _yearGarage;
  set yearGarage(value){
    _yearGarage = value;
    notifyListeners();
  }
  int _yearBuilt = 2022;
  int get yearBuilt => _yearBuilt;
  set yearBuilt(value){
    _yearBuilt = value;
    notifyListeners();
  }
}