import 'package:chinchin_merchant/login_registro/widgets/custom_toolbar_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundRegister extends StatelessWidget {
  final Widget child;
  const BackgroundRegister({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              bottom: 0,
              child: Container(
                  child: Column(
                children: [
                  Container(child: Text("Chinchin")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Text(
                      "V 1.0.0",
                    )),
                  ),
                ],
              ))),
          Positioned(
            top: -40,
            left: 0,
            child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                child: CustomPaint(
                  painter: CustomToolbarShape(),
                )),
          ),
          Positioned(
              top: size.height / 11,
              left: 8,
              child: Container(
                  height: 40,
                  child: CupertinoButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      )))),
          child,
        ],
      ),
    );
  }
}
