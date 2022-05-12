import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'mysql.dart';
import 'homepage.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  var db = new Mysql();
  var test = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
