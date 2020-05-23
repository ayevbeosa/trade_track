import 'package:flutter/material.dart';
import 'package:tradetrack/authentication.dart';
import 'package:tradetrack/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trade Track',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootPage(
        auth: Auth(),
      ),
    );
  }
}

//void _pushPage(BuildContext context, Widget page) {
//  Navigator.of(context).push(
//    MaterialPageRoute<void>(builder: (_) => page),
//  );
//}
