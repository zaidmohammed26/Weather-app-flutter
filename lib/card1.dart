import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  Card1({super.key, required this.data});
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Display weather image
                Image.asset(
                  imageString,
                  height: 100,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                // Add some spacing between the image and the text
                Container(width: 60),
                // Add an expanded widget to take up the remaining horizontal space
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Add some spacing between the top of the card and the title
                      Container(height: 5),
                      // Display the city name
                      Text(
                        "${data['name']}",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).dividerColor),
                      ),
                      // Add some spacing between the title and the subtitle
                      Container(height: 5),
                      // Display the weather condition
                      Text(
                        '${data['weather'][0]['main']}',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).shadowColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
