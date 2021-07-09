import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomSheet extends StatelessWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Chinchin",
        style: TextStyle(color: primaryLightColor),
      ),
    );
  }
}
