import 'package:druto_seba_driver/src/configs/app_texts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DivisionController extends GetxController {
  var division = ''.obs;

  Future<void> findDivision({required latitude, required longitude}) async {
    final apiKey = AppTexts.googleMapKey;
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final results = data['results'];
          if (results.isNotEmpty) {
            final addressComponents = results[0]['address_components'];
            // Extract division details from the response
            for (final component in addressComponents) {
              final types = component['types'];
              if (types.contains('administrative_area_level_1')) {
                division.value = component['long_name'];
                break;
              }
            }
          }
        } else {
          throw Exception('No division found');
        }
      } else {
        throw Exception('Failed to load division');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
