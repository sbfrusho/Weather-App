import 'package:flutter/material.dart';
import 'package:weather_app/ui/home.dart';
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      home: HomePage(),
    );
  }

}