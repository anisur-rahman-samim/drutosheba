import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddGariController extends GetxController{
  RxString imagePath = ''.obs;


  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);

      if (image != null) {
        imagePath.value = image.path;
        print("Image path: ${image.path}");

      }
    } catch (e) {
      print(e.toString());
    }
  }
}