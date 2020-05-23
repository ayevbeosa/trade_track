import 'package:flutter/material.dart';

class LoginSignUpPage extends StatefulWidget {
  @override
  _LoginSignUpPageState createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trade Track"),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            showForm(),
            showCircularProgress(),
          ],
        ),
      ),
    );
  }
}
