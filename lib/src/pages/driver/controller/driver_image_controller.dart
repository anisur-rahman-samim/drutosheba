import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DriverImageController extends GetxController{




  Future<String?> captureImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage == null) {
      return null;
    }
    final imagePath = pickedImage.path;

    return imagePath;
  }
}