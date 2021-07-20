import 'package:chinchin_merchant/common/style/custom/circle_left_custom_paint.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/material.dart';

class AppBarWhiteGree extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  const AppBarWhiteGree({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Stack(
        children: [
          Positioned(top: 20, right: 20, child: CircularPainterLeft()),
          Positioned(
              top: 50,
              right: 20,
              child: Image.asset("assets/images/chinchin_icon_white.png"))
        ],
      ),
      foregroundColor: primaryLightColor,
      backgroundColor: Colors.white,
      shape: ContinuousRectangleBorder(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(90.0),
        ),
      ),
      title: Text("Chinchin"),
      leading: Container(),
      // actions: [Stack(child: Image.asset("assets/images/chinchin_icon_white.png"))],

      // leading: IconButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     icon: Icon(Icons.arrow_back_ios))
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(size.height / 15);
}
