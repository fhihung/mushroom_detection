import 'package:flutter/material.dart';

import '../../../common/widgets/mushroom_card.dart';
import '../../../models/mushroom.dart';
import 'mushroom_detail_screen.dart';

class ExploreScreen extends StatelessWidget {
  final List<Mushroom> mushrooms = [
    Mushroom(
        name: 'Shiitake',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/6/64/Shiitakegrowing.jpg'),
    Mushroom(
        name: 'Portobello',
        imageUrl:
            'https://images.hollandandbarrettimages.co.uk/health-hub/2023/M08/portobello-mushrooms.png'),

    // Add more mushrooms here...
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: mushrooms.length,
      itemBuilder: (context, index) {
        return MushroomItem(mushroom: mushrooms[index]);
      },
    );
  }
}
