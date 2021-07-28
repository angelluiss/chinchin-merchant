import 'package:blobs/blobs.dart';
import 'package:chinchin_merchant/home/models/card_model.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/material.dart';

class CardDesign extends StatelessWidget {
  final CardData card;
  final int cardIndex;
  CardDesign({required this.card, required this.cardIndex});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2,
      decoration: BoxDecoration(
          color: card.color,
          boxShadow: [
            BoxShadow(color: card.color, offset: Offset(0, 0), blurRadius: 5)
          ],
          border: Border.all(color: primaryLightColor),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Stack(
        children: [
          Positioned(
              bottom: -50,
              child: Blob.random(
                size: size.width / 2,
                styles: BlobStyles(color: primaryLightColor.withOpacity(0.2)),
              )),
          Positioned(
              bottom: 50,
              right: 20,
              child: Blob.random(
                size: size.width / 2,
                styles: BlobStyles(color: primaryLightColor.withOpacity(0.2)),
              )),
          Positioned(
              top: -50,
              child: Blob.random(
                size: size.width / 2,
                styles: BlobStyles(color: primaryLightColor.withOpacity(0.2)),
              )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(
                //   Icons.transfer_within_a_station,
                //   color: Colors.black45,
                //   size: size.width / 6,
                // ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cardIndex != 1 ? card.image : card.imageAlter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${card.name}"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
