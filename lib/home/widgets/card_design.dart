import 'package:blobs/blobs.dart';
import 'package:chinchin_merchant/home/models/card_model.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/material.dart';

class CardDesign extends StatelessWidget {
  final CardData card;
  CardDesign({required this.card});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width - 40,
        height: size.width - 40,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: card.color,
            boxShadow: [
              BoxShadow(color: card.color, offset: Offset(0, 0), blurRadius: 5)
            ],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Stack(
          children: [
            Positioned(
                bottom: -50,
                child: Blob.random(
                  size: 150,
                  styles: BlobStyles(color: primaryLightColor.withOpacity(0.2)),
                )),
            Positioned(
                top: -50,
                child: Blob.random(
                  size: 250,
                  styles: BlobStyles(color: primaryLightColor.withOpacity(0.2)),
                )),
            // Positioned(
            //     top: -50,
            //     right: -50,
            //     child: Blob.random(
            //       size: 300,
            //       styles: BlobStyles(color: primaryLightColor.withOpacity(0.2)),
            //     )),
            Center(
              child: Icon(
                Icons.transfer_within_a_station,
                color: Colors.black45,
                size: size.width / 6,
              ),
            ),
            Positioned(
              top: 30,
              left: 30,
              right: 30,
              child: Container(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Current Balance",
                          style: TextStyle(color: Colors.black45),
                        ),
                        Text(
                          card.date,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Text(
                    //   "\$" + card.balance,
                    //   textAlign: TextAlign.start,
                    //   style: TextStyle(
                    //       color: Colors.black45,
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.bold),
                    // )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "****" + card.number,
                    style: TextStyle(color: Colors.black45, fontSize: 18),
                  ),
                  // Image(
                  //   image: AssetImage(card.image),
                  //   width: 50,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
