import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddressAutocomplete extends StatefulWidget {
  @override
  _AddressAutocompleteState createState() => _AddressAutocompleteState();
}

class _AddressAutocompleteState extends State<AddressAutocomplete> {
  final TextEditingController _controller = TextEditingController();
  List<String> _suggestions = [];

  Future<void> _fetchSuggestions(String input) async {
    final String baseUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    final String apiKey = 'AIzaSyAWzHqWnafr5A4-JbGV4B5kpKgP55TXu4g';

    final response = await http.get(Uri.parse("$baseUrl?input=$input&types=address&key=$apiKey&sessiontoken=1234567890"));
    final predictions = json.decode(response.body)['predictions'];
    setState(() {
      _suggestions = predictions.map<String>((e) => e['description'] as String).toList();
    });
  }

  void _selectAddress(String address) {
    print('Selected Address: $address');
    // You can do other operations with the selected address here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Location"),),
      body:  SingleChildScrollView(
        child: Column(
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
                  title: Text(_suggestions[index]),
                  onTap: () {
                    _controller.text = _suggestions[index];
                    _selectAddress(_suggestions[index]); // Call the function to handle selection
                    setState(() {
                      _suggestions = []; // Clear suggestions after selection
                    });
                  },
                );
              },
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
