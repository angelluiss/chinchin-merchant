import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomWidgetChinchin extends StatelessWidget {
  const BottomWidgetChinchin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Chinchin",
            style:
                TextStyle(color: primaryLightColor, fontSize: size.width / 30),
          ),
          Text(
            "V $version_app",
            style:
                TextStyle(color: primaryLightColor, fontSize: size.width / 30),
          ),
        ],
      ),
    );
  }
}
