import 'package:flutter/material.dart';
import 'homepage.dart';
import 'form.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Poluição luminosa',
      theme: ThemeData(
        primarySwatch:  Colors.blue,
      ),
      home: HomePage(),
    );
  }
}