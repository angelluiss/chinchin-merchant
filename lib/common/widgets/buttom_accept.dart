import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.onPressed, this.labelText});
  final GestureTapCallback onPressed;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.green,
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.face,
              color: Colors.amber,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Aceptar',
              maxLines: 1,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
