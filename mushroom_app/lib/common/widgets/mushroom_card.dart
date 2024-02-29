// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_app/utils/constants/sizes.dart';

import '../../features/explore/screens/explore_screen.dart';
import '../../features/explore/screens/mushroom_detail_screen.dart';
import '../../models/mushroom.dart';

class MushroomCard extends StatelessWidget {
  final Mushroom mushroom;

  const MushroomCard({Key? key, required this.mushroom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MushroomDetailScreen(mushroom: mushroom)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              ),
              child: Image.network(
                mushroom.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(TSizes.gridViewSpacing),
            child: Text(
              mushroom.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class MushroomItem extends StatefulWidget {
  final Mushroom mushroom;
  final Function()? onTap;

  const MushroomItem({
    Key? key,
    required this.mushroom,
    this.onTap,
  }) : super(key: key);

  @override
  _MushroomItemState createState() => _MushroomItemState();
}

class _MushroomItemState extends State<MushroomItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MushroomDetailScreen(mushroom: widget.mushroom)),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Swiper(
                  loop: true,
                  itemWidth: 300.0,
                  itemHeight: 180.0,
                  itemCount: 1,
                  layout: SwiperLayout.DEFAULT,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        widget.mushroom.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.mushroom.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   top: 8,
        //   right: 8,
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        //     decoration: BoxDecoration(
        //       color: TColors.primaryBackground.withOpacity(0.8),
        //       borderRadius: BorderRadius.circular(8.0),
        //     ),
        //     child: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Text(
        //           'New',
        //           // style: AppTextStyles.newMushrooms(),
        //           maxLines: 2,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
