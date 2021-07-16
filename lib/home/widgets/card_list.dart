import 'package:carousel_slider/carousel_slider.dart';
import 'package:chinchin_merchant/home/models/card_model.dart';
import 'package:chinchin_merchant/home/widgets/card_design.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return CardDesign(
    //   card: cards[0],
    // );

    return CarouselSlider.builder(
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int i, int itemIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CardDesign(
            card: cards[itemIndex],
          ),
        );
      },
      options: CarouselOptions(
          disableCenter: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          initialPage: 0,
          enableInfiniteScroll: false,
          enlargeCenterPage: false),
    );
  }
}
