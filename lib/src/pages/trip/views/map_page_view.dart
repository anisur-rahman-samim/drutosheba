import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../configs/appColors.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWithDirections extends StatefulWidget {
  @override
  _MapWithDirectionsState createState() => _MapWithDirectionsState();
}

class _MapWithDirectionsState extends State<MapWithDirections> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map with Directions',style: h2.copyWith(color: Colors.white),)),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(23.8069245, 90.36869779999999), // Initial position (San Francisco, CA)
          zoom: 12.0,
        ),
        markers: markers,
        polylines: polylines,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;

      // Add markers for start and end points
      markers.add(
        Marker(
          markerId: MarkerId('Start'),
          position: LatLng(23.8069245, 90.36869779999999), // Start point (San Francisco, CA)
          infoWindow: InfoWindow(title: 'Start'),
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('End'),
          position: LatLng(25.6216192, 88.638052), // End point (San Jose, CA)
          infoWindow: InfoWindow(title: 'End'),
        ),
      );
    });

    // Get directions between markers
    getDirections();
  }

  // Method to fetch directions using Google Maps Directions API
  void getDirections() async {
    final start = LatLng(23.8069245, 90.36869779999999); // Start point (San Francisco, CA)
    final end = LatLng(25.6216192, 88.638052); // End point (San Jose, CA)

    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=AIzaSyAWzHqWnafr5A4-JbGV4B5kpKgP55TXu4g'));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final points = decoded['routes'][0]['overview_polyline']['points'];
      List<LatLng> decodedPoints = decodePolyline(points);

      // Draw the route on the map
      setState(() {
        polylines.add(Polyline(
          polylineId: PolylineId('route'),
          points: decodedPoints,
          width: 5,
          color: Colors.blue,
        ));
      });
    } else {
      throw Exception('Failed to load directions');
    }
  }

  List<LatLng> decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }
}

