import 'package:flutter/material.dart';

class ChangerController extends ChangeNotifier {
  dynamic value;


  void setValue(dynamic value) {
    this.value = value;
    notifyListeners();
  }


}