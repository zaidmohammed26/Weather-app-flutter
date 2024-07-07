import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  Card2({super.key, required this.data});
  final Map<String, dynamic> data;
  String imageString = 'images/clear.png';

  @override
  Widget build(BuildContext context) {
    // Update image string based on weather condition
    if (data['weather'][0]['main'] == 'Rain' ||
        data['weather'][0]['main'] == 'Clouds') {
      imageString = 'images/rain.jpg';
    }
    return Card(
      // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // Set the clip behavior of the card
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // Define the child widgets of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
          Image.asset(
            imageString,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Add a container with padding that contains the card's title, text, and buttons
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Display the temperature in Celsius
                Center(
                  child: Text(
                    "${data['main']['temp']} \u2103",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                // Add a space between the title and the text
                Container(height: 20),
                // Display humidity and wind speed
                Row(
                  children: [
                    Text(
                      'Humidity: ${data['main']['humidity']}%',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Wind Speed: ${data['wind']['speed']} m/s',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                // Add a small space between the card and the next widget
              ],
            ),
          ),
          Container(height: 5),
        ],
      ),
    );
  }
}
