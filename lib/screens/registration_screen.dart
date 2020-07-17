import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tradetrack/components/rounded_button.dart';
import 'package:tradetrack/utils/constants.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  bool _showSpinner = false;
  String _email;
  String _password;
  String _errorMessage;

  /// Check if form is valid
  bool validate() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void onSubmit() async {
    hideKeyboard(context);
    if (validate()) {
      setState(() {
        _errorMessage = "";
        _showSpinner = true;
      });

      try {
        final authResult = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (authResult != null) {
          Navigator.pushNamed(context, '');
        }
      } on PlatformException catch (e) {
        print('Error: $e');
        setState(() {
          _showSpinner = false;
          _errorMessage = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        child: Image.asset('assets/demo_launch_icon.png'),
                      ),
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.blueGrey,
                        ),
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'Field is required' : null,
                      onSaved: (value) => _email = value.trim(),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      autofocus: false,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Password',
                        icon: Icon(
                          Icons.lock,
                          color: Colors.blueGrey,
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field is required';
                        }
                        if (value.length < 6) {
                          return 'Password should be at least 6 characters';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value.trim(),
                    ),
                    RoundedButton(
                      title: 'Register',
                      colour: Colors.lightBlueAccent,
                      onPressed: onSubmit,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '');
                      },
                      child: Text(
                        'Have an account? Sign in',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
