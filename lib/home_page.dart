import 'package:flutter/material.dart';
import 'package:tradetrack/authentication.dart';

class HomePage extends StatelessWidget {
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  const HomePage({Key key, this.auth, this.logoutCallback, this.userId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TradeTrack'),
      ),
      body: Container(
        child: Text('Don\'t make me wait forever.'),
      ),
    );
  }
}
