import 'package:flutter/material.dart';
import 'package:mushroom_app/utils/constants/text_strings.dart';

import '../../explore/screens/explore_screen.dart';
import '../../explore/screens/upload_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final screens = [
    ExploreScreen(),
    SearchScreen(),
    UploadScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(TTexts.explore),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: TTexts.explore,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: TTexts.search,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: TTexts.upload,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search Mushrooms'));
  }
}
