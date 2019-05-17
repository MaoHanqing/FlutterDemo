import 'dart:ui';
import 'package:flutter/material.dart';
import './me/index.dart';
void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'me':
      return Me();
    case '/':
      return Me();
    default:
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
  }
} 
