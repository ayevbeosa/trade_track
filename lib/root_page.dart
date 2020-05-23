import 'package:flutter/material.dart';
import 'package:tradetrack/authentication.dart';
import 'package:tradetrack/home_page.dart';
import 'package:tradetrack/login_signup_page.dart';

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
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_SIGNED_IN:
        return LoginSignUpPage(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.SIGNED_IN:
        if (_userId.length > 0 && _userId != null) {
          return HomePage(
            auth: widget.auth,
            userId: _userId,
            logoutCallback: logoutCallback,
          );
        } else {
          return buildWaitingScreen();
        }
        break;
      default:
        return buildWaitingScreen();
    }
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.SIGNED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_SIGNED_IN;
      _userId = "";
    });
  }
}
