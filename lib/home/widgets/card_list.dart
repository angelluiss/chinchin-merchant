import 'package:carousel_slider/carousel_slider.dart';
import 'package:chinchin_merchant/home/models/card_model.dart';
import 'package:chinchin_merchant/home/widgets/card_design.dart';
import 'package:chinchin_merchant/p2p/pages/pago_movil.dart';
import 'package:chinchin_merchant/pago_chinchin/pages/pago_chinchin.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int i, int itemIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: CardDesign(
              card: cards[itemIndex],
              cardIndex: itemIndex,
            ),
            onTap: () {
              switch (itemIndex) {
                case 0:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PagoMovilPage()));
                  break;
                case 1:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PagoChinchinPage()));
                  break;
                case 2:
                  break;
                case 3:
                  break;

                default:
              }
            },
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
