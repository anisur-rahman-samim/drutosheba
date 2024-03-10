import 'package:get/get.dart';

class ReturnTripController extends GetxController{
  var selectedCar = RxString('');
  var selectedCarCapacity = ''.obs;
  var selectedCarImage = ''.obs;

  var dateSelected = 'তারিখ সিলেক্ট করুন'.obs;
  var timeSelected = 'সময় সিলেক্ট করুন'.obs;

}