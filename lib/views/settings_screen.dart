import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nps/utilities/commons.dart';
import 'package:nps/utilities/size_config.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
            child: Center(child: Text('Settings')),
          );
  }
}
