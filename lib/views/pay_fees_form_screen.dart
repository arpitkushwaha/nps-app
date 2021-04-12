import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:nps/utilities/commons.dart';
import 'package:nps/utilities/constants.dart';

class PayFeesFormScreen extends StatefulWidget {
  @override
  _PayFeesFormScreenState createState() => _PayFeesFormScreenState();
}

class _PayFeesFormScreenState extends State<PayFeesFormScreen> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    Common.appBarTitle = "Fees Form";
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: WebviewScaffold(
        appBar: Common.appBarWithAlertDialog(context),
        url: Constant.pay_fees_google_form_link,
        userAgent: 'Fake',
        clearCookies: false,
        clearCache: false,
        hidden: true,
        appCacheEnabled: true,
        supportMultipleWindows: true,
      ),
    );
  }
}