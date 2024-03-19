import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DistanceTimeController extends GetxController {
  var totalDistance = 0.0.obs;
  var totalDuration = ''.obs;

  Future<void> calculateDistanceAndDuration(double startLat, double startLng, double endLat, double endLng) async {
    final apiKey = 'AIzaSyAWzHqWnafr5A4-JbGV4B5kpKgP55TXu4g';
    final url = 'https://maps.googleapis.com/maps/api/distancematrix/json?'
        'origins=$startLat,$startLng&destinations=$endLat,$endLng&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final distanceText = data['rows'][0]['elements'][0]['distance']['text'];
      final durationText = data['rows'][0]['elements'][0]['duration']['text'];
      print(distanceText);
      print(durationText);
     // String timeString = "1 hour 5 minutes";

     /* List<String> parts = durationText.split(" ");
      int hours = int.parse(parts[0]);
      int minutes = int.parse(parts[2]);

      int totalMinutes = hours * 60 + minutes;

      print(totalMinutes);*/
      totalDistance.value = double.parse(distanceText.split(' ')[0]);
      /*int totalMinutes = convertToMinutes(durationText);
     // Extract distance in kilometers
      print("total min: "+totalMinutes.toString());

        *//*List<String> parts = totalSeconds.split(' ');
        int min = int.parse(parts[0]);*//*
       // int minutes = int.parse(parts[1]);

      int hours = totalMinutes ~/ 60;
      int minutes = totalMinutes % 60;*/
    //  totalDuration.value =  '$hours ঘ. $minutes মি' ;
      totalDuration.value =  durationText ;

  }}
  int convertToMinutes(String timeString) {
    List<String> parts = timeString.split(' ');

    int hours = 0;
    int minutes = 0;

    for (int i = 0; i < parts.length; i += 2) {
      if (parts[i + 1] == 'hours') {
        hours = int.tryParse(parts[i]) ?? 0;
      } else if (parts[i + 1] == 'mins') {
        minutes = int.tryParse(parts[i]) ?? 0;
      }
    }

    return hours * 60 + minutes;
  }
}
