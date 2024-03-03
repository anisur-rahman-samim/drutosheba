import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DriverImageController extends GetxController{

  RxString profileImagePath = ''.obs;
  RxString drivingLicenceImagePath = ''.obs;
  RxString nidFrontImagePath = ''.obs;
  RxString nidBackImagePath = ''.obs;


  Future<void> profilePickImage(ImageSource source) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);

      if (image != null) {
        profileImagePath.value = image.path;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> drivingLicencePickImage(ImageSource source) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);

      if (image != null) {
        drivingLicenceImagePath.value = image.path;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> nidFrontPickImage(ImageSource source) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);

      if (image != null) {
        nidFrontImagePath.value = image.path;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> nidBackPickImage(ImageSource source) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);

      if (image != null) {
        nidBackImagePath.value = image.path;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}