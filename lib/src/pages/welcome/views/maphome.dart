import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddressAutocomplete extends StatefulWidget {
  @override
  _AddressAutocompleteState createState() => _AddressAutocompleteState();
}

class _AddressAutocompleteState extends State<AddressAutocomplete> {
  final TextEditingController _controller = TextEditingController();
  List<Suggestion> _suggestions = [];

  Future<void> _fetchSuggestions(String input) async {
    final String baseUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&components=country:BD&key=AIzaSyAWzHqWnafr5A4-JbGV4B5kpKgP55TXu4g&sessiontoken=1234567890";

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == 'OK') {
        final predictions = jsonData['predictions'];
        setState(() {
          _suggestions = predictions
              .map<Suggestion>((e) => Suggestion.fromJson(e))
              .toList();
        });
      } else {
        throw Exception('Failed to load suggestions: ${jsonData['status']}');
      }
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  void _selectAddress(Suggestion suggestion) async {
    final String placeId = suggestion.placeId;
    final String detailsUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry,address_components&key=AIzaSyAWzHqWnafr5A4-JbGV4B5kpKgP55TXu4g";

    final response = await http.get(Uri.parse(detailsUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final Map<String, dynamic> result = jsonData['result'];
      final Map<String, dynamic> geometry = result['geometry'];
      final Map<String, dynamic> location = geometry['location'];
      final double lat = location['lat'];
      final double lng = location['lng'];

      final List<dynamic> addressComponents = result['address_components'];
      String divisionName = '';

      // Find the administrative_area_level_1 component
      for (final component in addressComponents) {
        final List<dynamic> types = component['types'];
        if (types.contains('administrative_area_level_1')) {
          divisionName = component['long_name'];
          break;
        }
      }

      print('Selected Address: ${suggestion.description}');
      print('Division Name: $divisionName');
      print('Latitude: $lat, Longitude: $lng');

      // You can do other operations with the address, division name, lat, and lng here
    } else {
      throw Exception('Failed to fetch place details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter Address',
            ),
            onChanged: (value) {
              _fetchSuggestions(value);
            },
          ),
          SizedBox(height: 10),
          _suggestions.isNotEmpty
              ? ListView.builder(
            shrinkWrap: true,
            itemCount: _suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_suggestions[index].description),

                onTap: () {
                  _controller.text = _suggestions[index].description;
                  _selectAddress(_suggestions[index]);
                  setState(() {
                    _suggestions = [];
                  });
                },
              );
            },
          )
              : Container(),
        ],
      ),
    );
  }
}

class Suggestion {
  final String description;
  final String placeId;

  Suggestion({
    required this.description,
    required this.placeId,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      description: json['description'],
      placeId: json['place_id'],
    );
  }
}
