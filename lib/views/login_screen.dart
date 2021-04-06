import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nps/utilities/commons.dart';
import 'package:nps/utilities/strings.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appBar(),
      body: Text(
        Strings.login
      ),
    );
  }
}
