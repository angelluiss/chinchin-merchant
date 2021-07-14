import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomAppBar extends StatefulWidget {
  final Size size;
  CustomAppBar({Key? key, required this.size});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height / 6,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: widget.size.width,
            // height: widget.size.height / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(41),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x7f1446a0),
                  blurRadius: 36,
                  offset: Offset(0, 16),
                ),
              ],
              color: Color(0xff14c6a4),
            ),
            child: Stack(
              children: [
                _navigationDrawer(),
                _imageWithOpacity(),
                _textNavigationbar()
              ],
            ),
          ),
        ],
      ),
    );
  }

  _imageWithOpacity() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Image.asset(
            'assets/images/chinchin_icon_white_with_opacity.png',
            height: 80,
            width: 80,
          ),
        ),
      ),
    );
  }

  _textNavigationbar() {
    return Positioned(
        right: widget.size.width / 20,
        top: widget.size.height / 10,
        child: Container(
          child: Text(
            'Hello Motor hammer',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ));
  }

  _navigationDrawer() {
    return Positioned(
      left: widget.size.width / 20,
      top: widget.size.height / 12,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: CupertinoButton(
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            print("Drawer Pressed");
            // if (details.delta.dx < 6 && !rtl || details.delta.dx < -6 && rtl) {
            ZoomDrawer.of(context)!.toggle();
            // }
          },
        ),
      ),
    );
  }
}
