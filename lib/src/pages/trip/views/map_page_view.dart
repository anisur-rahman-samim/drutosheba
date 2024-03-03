import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../configs/appColors.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylines = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Route',style: h2.copyWith(color: white),),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 14.0,
        ),
        markers: markers,
        polylines: polylines,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('marker1'),
          position: LatLng(37.42796133580664, -122.085749655962),
          infoWindow: InfoWindow(title: 'Marker 1'),
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('marker2'),
          position: LatLng(37.42796133580664, -122.075749655962),
          infoWindow: InfoWindow(title: 'Marker 2'),
        ),
      );
      _addPolyline();
    });
  }

  void _addPolyline() {
    polylineCoordinates.clear();
    polylineCoordinates.add(LatLng(37.42796133580664, -122.085749655962));
    polylineCoordinates.add(LatLng(37.42796133580664, -122.075749655962));

    setState(() {
      polylines.add(
        Polyline(
          polylineId: PolylineId('route1'),
          color: Colors.blue,
          points: polylineCoordinates,
        ),
      );
    });
  }
}
