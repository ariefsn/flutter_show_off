import 'package:flutter/material.dart';
import 'views/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Show Off',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(title: "Show Off",),
    );
  }
}
