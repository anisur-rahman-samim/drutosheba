
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../welcome/views/maphome.dart';

class LocationController extends GetxController{
  var isLoading = false.obs;
  var isLoadingDrop = false.obs;

  var pickUpLocation = 'পিকআপ'.obs;
  var dropLocation = 'গন্তব্য'.obs;


  RxList suggestionsPickUp = <Suggestion>[].obs;
  RxList suggestionsDrop = <Suggestion>[].obs;






  Future<void> fetchPickSuggestions(String input) async {
    isLoading(true);
    final String baseUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&components=country:BD&key=AIzaSyDhzY2k-tIrpnoBut75TTDJTuE1kURA_fU&sessiontoken=1234567890";

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == 'OK') {
        final predictions = jsonData['predictions'];
        suggestionsPickUp.clear();
          suggestionsPickUp.addAll(predictions
              .map<Suggestion>((e) => Suggestion.fromJson(e))
              .toList());
        isLoading(false);
      } else {
        isLoading(false);
        throw Exception('Failed to load suggestions: ${jsonData['status']}');
      }
    } else {
      isLoading(false);
      throw Exception('Failed to load suggestions');
    }
  }
  Future<void> fetchDropSuggestions(String input) async {
    isLoadingDrop(true);
    final String baseUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&components=country:BD&key=AIzaSyDhzY2k-tIrpnoBut75TTDJTuE1kURA_fU&sessiontoken=1234567890";

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == 'OK') {
        final predictions = jsonData['predictions'];
        suggestionsDrop.clear();
        suggestionsDrop.addAll(predictions
              .map<Suggestion>((e) => Suggestion.fromJson(e))
              .toList());
        isLoadingDrop(false);
      } else {
        isLoadingDrop(false);
        throw Exception('Failed to load suggestions: ${jsonData['status']}');
      }
    } else {
      isLoadingDrop(false);
      throw Exception('Failed to load suggestions');
    }
  }

  void selectPikUpAddress(Suggestion suggestion) async {

    final String placeId = suggestion.placeId;
    final String detailsUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry,address_components&key=AIzaSyDhzY2k-tIrpnoBut75TTDJTuE1kURA_fU";

    final response = await http.get(Uri.parse(detailsUrl));
    isLoading(true);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final Map<String, dynamic> result = jsonData['result'];
      final Map<String, dynamic> geometry = result['geometry'];
      final Map<String, dynamic> location = geometry['location'];
      final double lat = location['lat'];
      final double lng = location['lng'];

      final List<dynamic> addressComponents = result['address_components'];
      String divisionName = '';
      isLoading(false);
      // Find the administrative_area_level_1 component
      for (final component in addressComponents) {
        final List<dynamic> types = component['types'];
        if (types.contains('administrative_area_level_1')) {
          divisionName = component['long_name'];
          break;
        }
      }

      print('Selected PickUp Address: ${suggestion.description}');
      pickUpLocation.value = suggestion.description;
      print('Division PickUp Name: $divisionName');
      print('Latitude: $lat, Longitude: $lng');

      // You can do other operations with the address, division name, lat, and lng here
    } else {
      throw Exception('Failed to fetch place details');
    }
  }
  void selectDropAddress(Suggestion suggestion) async {

    final String placeId = suggestion.placeId;
    final String detailsUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry,address_components&key=AIzaSyDhzY2k-tIrpnoBut75TTDJTuE1kURA_fU";

    final response = await http.get(Uri.parse(detailsUrl));
    isLoading(true);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final Map<String, dynamic> result = jsonData['result'];
      final Map<String, dynamic> geometry = result['geometry'];
      final Map<String, dynamic> location = geometry['location'];
      final double lat = location['lat'];
      final double lng = location['lng'];

      final List<dynamic> addressComponents = result['address_components'];
      String divisionName = '';
      isLoading(false);
      // Find the administrative_area_level_1 component
      for (final component in addressComponents) {
        final List<dynamic> types = component['types'];
        if (types.contains('administrative_area_level_1')) {
          divisionName = component['long_name'];
          break;
        }
      }

      print('Selected Drop Address: ${suggestion.description}');
      dropLocation.value = suggestion.description;
      print('Division Drop Name: $divisionName');
      print('Latitude: $lat, Longitude: $lng');

      // You can do other operations with the address, division name, lat, and lng here
    } else {
      throw Exception('Failed to fetch place details');
    }
  }

}