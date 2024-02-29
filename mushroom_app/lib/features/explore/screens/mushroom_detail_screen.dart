import 'package:flutter/material.dart';

import '../../../models/mushroom.dart';
import 'explore_screen.dart';

class MushroomDetailScreen extends StatelessWidget {
  final Mushroom mushroom;

  const MushroomDetailScreen({Key? key, required this.mushroom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mushroom.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(mushroom.imageUrl, fit: BoxFit.cover),
            SizedBox(height: 8),
            Text(
              "Detailed Information",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Add more detailed information about the mushroom here
          ],
        ),
      ),
    );
  }
}
