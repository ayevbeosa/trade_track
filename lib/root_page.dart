import 'package:flutter/material.dart';
import 'package:tradetrack/authentication.dart';

enum AuthStatus { NOT_DETERMINED, NOT_SIGNED_IN, SIGNED_IN }

class RootPage extends StatefulWidget {
  RootPage(this.auth);

  final BaseAuth auth;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_SIGNED_IN : AuthStatus.SIGNED_IN;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
