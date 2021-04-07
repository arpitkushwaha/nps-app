import 'package:nps/models/image_model.dart';

class HomeController {
  List<ImageModel> getOptionsList()
  {
    return [
      ImageModel(
          imageName: "Pay Fees",
          imageUrl:"assets/images/pay_fees.png"
      ),
      ImageModel(
          imageName: "Admission Form",
          imageUrl:"assets/images/admission_form.png"
      ),
      // ImageModel(
      //     imageName: "NPS",
      //     imageUrl:"assets/images/noble.png"
      // ),
      // ImageModel(
      //     imageName: "NPS",
      //     imageUrl:"assets/images/noble.png"
      // ),
      // ImageModel(
      //     imageName: "NPS",
      //     imageUrl:"assets/images/noble.png"
      // ),
    ] ;
  }
}
