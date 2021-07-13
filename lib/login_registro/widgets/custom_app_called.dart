import 'package:chinchin_merchant/login_registro/widgets/custom_toolbar_shape.dart';
import 'package:flutter/material.dart';

class CustomToolbar extends StatelessWidget {
  final double height;

  const CustomToolbar({required this.height});

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: Stack(fit: StackFit.loose, children: <Widget>[
          Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: height,
              child: CustomPaint(
                painter: CustomToolbarShape(),
              )),
        ]));
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
