import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:nps/controllers/home_controller.dart';
import 'package:nps/models/image_model.dart';
import 'package:nps/utilities/constants.dart';
import 'package:nps/utilities/size_config.dart';

class OptionSlider extends StatefulWidget {
  @override
  _OptionSliderState createState() => _OptionSliderState();
}

class _OptionSliderState extends State<OptionSlider> {

  HomeController homeController = HomeController();
  List<ImageModel> optionsList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    optionsList = homeController.getOptionsList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                'Are you looking for ?',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('See More'),
              ),
            ],
          ),
        ),
        Container(
          height: 210,
          width: 550,
          child: WidgetSlider(context),
        ),
      ],
    );
  }

  Swiper WidgetSlider(context) {
    return new Swiper(
      autoplay: true,
      viewportFraction: 0.8,
      scale: 1,
      itemCount:optionsList
          .length,
      itemBuilder: (context, index) {
        return Padding(
          padding:
          const EdgeInsets.only(top: 20, bottom: 30, left: 0, right: 35),
          child: InkWell(
            onTap: () {
              showAlertBox(context, index);
            },
            child: Container(
              height: 50,
              width: 10,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.29), BlendMode.dstATop),
                  image: AssetImage(optionsList[index].imageUrl),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  '${optionsList[index].imageName}',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AlertDialog showAlertBox(BuildContext context, int index) {
    var alertBox = AlertDialog(
      title: Text(
        'Name : ${optionsList[index].imageName}',
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext) {
          return alertBox;
        });
  }

}