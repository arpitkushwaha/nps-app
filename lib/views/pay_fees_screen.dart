import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nps/utilities/commons.dart';
import 'package:nps/utilities/constants.dart';
import 'package:nps/utilities/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class PayFeesScreen extends StatefulWidget {
  @override
  _PayFeesScreenState createState() => _PayFeesScreenState();
}

class _PayFeesScreenState extends State<PayFeesScreen> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Common.appBarTitle = "Pay Fees";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appBarWithAlertDialog(context),
      body: Container(
        child: Column(
          children: [

            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),

            Image.asset(
              "assets/images/nps_banner.png"
            ),

            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('Make Payment using any UPI App'),
                    content: Column(
                      children: <Widget>[
                        Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.copy),
                                Text('Copy UPI ID : 9414078951@paytm',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        side: BorderSide(
                                            color: Color(
                                                Constant.primaryColor))))),
                            onPressed: () {
                              //var data = jsonEncode(command.dioError);
                              Clipboard.setData(
                                  ClipboardData(text: '9414078951@paytm'));
                              final snackBar = SnackBar(
                                content: Text('UPI ID Copied'),
                                action: SnackBarAction(
                                  label: 'Copied',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              //snackBar();
                            },
                            // icon: Icon(Icons.copy, color: Colors.white),
                            // textColor: Colors.white,
                            // splashColor: Color(Constant.primaryColor),
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Fill the Google Form'),
                    content: Column(
                      children: <Widget>[
                        Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.open_in_browser),
                                Text('Open Google Form',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        side: BorderSide(
                                            color: Color(
                                                Constant.primaryColor))))),
                            onPressed: () {
                              _launchGoogleForm();
                              //var data = jsonEncode(command.dioError);
                              final snackBar = SnackBar(
                                content: Text('Opening Google Form'),
                                action: SnackBarAction(
                                  label: 'Opening',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              //snackBar();
                            },
                            // icon: Icon(Icons.copy, color: Colors.white),
                            // textColor: Colors.white,
                            // splashColor: Color(Constant.primaryColor),
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Complete'),
                    content: Column(
                      children: <Widget>[],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.list),
      //   onPressed: switchStepsType,
      // ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (_currentStep == 2) {
      Navigator.pop(context);
    }
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  void _launchGoogleForm() async =>
      Navigator.pushNamed(context, Constant.payFeesFormScreenRoute);
}
