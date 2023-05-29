import 'package:flutter/material.dart';

class AppNavigator{
  static final AppNavigator _instance=AppNavigator._();
  AppNavigator._();
  static AppNavigator get instance => _instance;
  final GlobalKey<NavigatorState> navigatorKey =GlobalKey<NavigatorState>();
  void removeUntil(Widget screen){
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) =>  screen),
      ModalRoute.withName('/'),
    );
  }
}