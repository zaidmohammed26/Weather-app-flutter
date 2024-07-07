import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/weather_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // AppBar with centered title and custom colors from the theme
        appBar: AppBar(
          backgroundColor: Theme.of(context).hoverColor,
          title: Center(
            child: Text(
              "Weather App",
              style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
            ),
          ),
        ),
        // Main body of the app
        body: Center(
          child: Container(
            // Padding for the container
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // Fixed height for the container
            height: 600,
            child: Column(
              children: [
                // CSC Picker widget for selecting country, state, and city
                CSCPicker(
                  flagState: CountryFlag.DISABLE, // Disable country flags
                  dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10)), // Rounded corners
                    color: Colors.white, // Background color
                    border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1), // Border color and width
                  ),
                  countryFilter: const [
                    // Limit the countries available for selection
                    CscCountry.India,
                    CscCountry.United_Kingdom,
                    CscCountry.United_States,
                  ],
                  countrySearchPlaceholder:
                      "Country", // Placeholder for country search
                  stateSearchPlaceholder:
                      "State", // Placeholder for state search
                  citySearchPlaceholder: "City", // Placeholder for city search
                  countryDropdownLabel:
                      "Select a Country", // Label for country dropdown
                  stateDropdownLabel:
                      "Select a State", // Label for state dropdown
                  cityDropdownLabel: "Select a City", // Label for city dropdown
                  selectedItemStyle: const TextStyle(
                    color: Color.fromARGB(
                        255, 7, 7, 7), // Text color for selected item
                    fontSize: 14, // Font size
                    fontWeight: FontWeight.w100, // Font weight
                  ),
                  dropdownHeadingStyle: const TextStyle(
                    color: Colors.black, // Heading text color
                    fontSize: 17, // Heading font size
                    fontWeight: FontWeight.bold, // Heading font weight
                  ),
                  dropdownItemStyle: const TextStyle(
                    color: Colors.black, // Item text color
                    fontSize: 14, // Item font size
                  ),
                  dropdownDialogRadius: 10.0, // Radius for dropdown dialog
                  searchBarRadius: 10.0, // Radius for search bar
                  // Callback for when the country changes
                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
                  // Callback for when the state changes
                  onStateChanged: (value) {
                    setState(() {
                      stateValue = value;
                    });
                  },
                  // Callback for when the city changes
                  onCityChanged: (value) {
                    setState(() {
                      cityValue = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10, // Spacing between CSC Picker and button
                ),
                // Button to get weather for the selected city
                ElevatedButton(
                  onPressed: () {
                    query =
                        "$cityValue"; // Set the query to the selected city value
                    // Navigate to WeatherDetails screen with the query
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => WeatherDetails(query: query),
                    ));
                  },
                  child: const Text("Get Weather"), // Button text
                ),
              ],
            ),
          ),
        ));
  }
}
