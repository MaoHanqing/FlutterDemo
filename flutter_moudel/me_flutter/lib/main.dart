import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './me/index.dart';
void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case '/me':
      return Me();
    case '/d':
      return Me();
    default:
      return Center(
        
        child: Container(
          child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
          color: CupertinoColors.destructiveRed,
        )
      );
  }
} 
