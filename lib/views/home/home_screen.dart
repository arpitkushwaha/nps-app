import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:nps/utilities/commons.dart';
import 'package:nps/utilities/constants.dart';
import 'package:nps/utilities/size_config.dart';
import 'package:nps/views/home/option_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Common.appBarTitle = "Noble Public School";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          child: ListView(
            children: [

              SizedBox(
                height: SizeConfig.blockSizeVertical * 4,
              ),

              InkWell(
                onTap: () {
                  Common.showAlertBox(context, 1);
                }, // handle your image tap here
                child: Image.asset(
                  "assets/images/introSvg.png",
                  height: 150,
                ),
              ),

              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(Constant.primaryColor),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [

                            IconButton(
                              padding: EdgeInsets.all(15),
                                color: Colors.pink,
                                icon: Icon(
                                  Icons.phone,
                                  size: 30,
                                  //color: Color(Constant.primaryColor),
                                ),
                                onPressed: () {_launchCall();}),
                          ],
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 16,
                        ),
                        Column(
                          children: [
                            IconButton(
                                padding: EdgeInsets.all(15),
                                color: Colors.green,
                                icon: Icon(
                                  Icons.location_on,
                                  size: 30,
                                  //color: Color(Constant.primaryColor),
                                ),
                                onPressed: () {openMapsSheet(context);}),
                          ],
                        ),

                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 16,
                        ),
                        Column(
                          children: [
                            IconButton(
                              padding: EdgeInsets.all(15),
                              color: Colors.amber,
                                icon: Icon(
                                  Icons.message,
                                  size: 30,
                                  //color: Color(Constant.primaryColor),
                                ),
                                onPressed: () {_modalBottomSheetMenu();}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),



                OptionSlider(),
              // HomeSection2(),
              // HomeSection3(),
              // HomeSection4(),
              // HomeSection7(),
            ],
          ),
        );
  }


  void _launchCall() async =>
      await canLaunch("tel: +919414078951") ? await launch("tel: +919414078951") : throw 'Could not launch';

  void _launchSMS() async =>
      await canLaunch("sms: +919414078951") ? await launch("sms: +919414078951") : throw 'Could not launch';

  openMapsSheet(context) async {
    try {
      final coords = Coords(25.12305617762715, 75.84336504467039);
      final title = "Noble Public School";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }


  void _modalBottomSheetMenu(){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return new Container(
            height: 150.0,
            color: Color(0xFF737373), //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0))),
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    title: Text('Whatsapp'),
                    onTap: (){
                      FlutterOpenWhatsapp.sendSingleMessage("+91 9414078951", "");
                      print('whatsapp');
                    },
                    leading: SvgPicture.asset(
                      'assets/icons/whatsapp.svg',
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
                  ListTile(
                    title: Text('SMS'),
                    onTap: (){
                      _launchSMS();
                    },
                    leading: SvgPicture.asset(
                      'assets/icons/sms.svg',
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
                ],
              ),),
          );
        }
    );
  }

}
