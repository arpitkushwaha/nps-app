import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nps/utilities/commons.dart';
import 'package:nps/utilities/size_config.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
            child: Center(child: Text('Notifications')),
          );
  }
}