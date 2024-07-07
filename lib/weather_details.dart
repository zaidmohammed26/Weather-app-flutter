import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/card1.dart';
import 'package:weather_app/card2.dart';

class WeatherDetails extends StatefulWidget {
  const WeatherDetails({super.key, required this.query});
  final String query;
  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  // Variables to track loading state and image to display
  var _isLoading = true;
  var _isError = false;
  var imageString = 'images/clear.png';
  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
    // Start the geocoding API call when the widget is initialized
    directGeocodingAPI(widget.query);
  }

  // Function to call the geocoding API with the provided query
  void directGeocodingAPI(String query) async {
    final String url =
        'http://api.openweathermap.org/geo/1.0/direct?q=$query&limit=5&appid=8eb2dc3faa76fdd5b776f4f04dc5957f';

    try {
      // Make the HTTP GET request
      final response = await http.get(Uri.parse(url));
      if (response.statusCode >= 400) {
        setState(() {
          _isError = true;
          _isLoading = false;
        });
      }
      if (response.body == '[]') {
        setState(() {
          _isError = true;
          _isLoading = false;
        });
      }
      final List<dynamic> data = json.decode(response.body);
      final lat = data[0]['lat'];
      final lon = data[0]['lon'];
      // Call the weather API with the obtained latitude and longitude
      weatherApi(lat, lon);
    } catch (err) {
      // Handle errors and stop loading
      setState(() {
        _isError = true;
        _isLoading = false;
      });
    }
  }

  // Function to call the weather API with the provided latitude and longitude
  void weatherApi(double lat, double lon) async {
    final String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=8eb2dc3faa76fdd5b776f4f04dc5957f';

    try {
      // Make the HTTP GET request
      final response = await http.get(Uri.parse(url));
      if (response.body == "null") {
        setState(() {
          _isError = true;
          _isLoading = false;
        });
      }
      data = json.decode(response.body);

      // Update the state to stop loading and show the data
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      // Handle errors and stop loading
      setState(() {
        _isError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_isError) {
      return Center(
        child: AlertDialog(
          title: const Text("Error occured"),
          content: const Text("This data for the city is not available."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        // Display the city name in the app bar title
        title: Center(
            child: Text(
          "Details",
          style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
        )),
        backgroundColor: Theme.of(context).hoverColor,
        actions: [
          // Refresh button to reload the weather data
          IconButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  directGeocodingAPI(widget.query);
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Card1(data: data),
            Container(
              height: 30, // Spacing between the cards
            ),
            Card2(data: data),
          ],
        ),
      ),
    );
  }
}
