import 'package:chinchin_merchant/common/style/custom/circle_left_custom_paint.dart';

import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CobrodeOrden extends StatefulWidget {
  CobrodeOrden({Key? key}) : super(key: key);

  @override
  _CobrodeOrdenState createState() => _CobrodeOrdenState();
}

class _CobrodeOrdenState extends State<CobrodeOrden> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBarGreen(size),
      body: Container(
        color: backgroundColorLight,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("Estatus: Creada",
                          style:
                              TextStyle(fontSize: 20, color: Colors.black45)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("\$ 20,00",
                          style:
                              TextStyle(fontSize: 30, color: Colors.black45)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("\$ 20,00",
                          style: TextStyle(
                              fontSize: 30, color: primaryLightColor)),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black12,
                      height: 1,
                      width: size.width - 80,
                    )),
                Container(
                  width: 250,
                  height: 255,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffe5e5e5),
                  ),
                  child: Icon(
                    Icons.qr_code,
                    size: 240,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black12,
                      height: 1,
                      width: size.width - 80,
                    )),
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("Orden Nro. 012251125",
                          style: TextStyle(
                              fontSize: 16, color: primaryLightColor)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("13/05/2021 15:32:02",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black54)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("Pedido: 151165",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black54)),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _appBarGreen(Size size) {
    return AppBar(
        toolbarHeight: size.height / 6,
        flexibleSpace: Stack(
          children: [
            Positioned(top: 0, right: 0, child: CircularPainterLeft()),
            Positioned(
                top: 10,
                right: 10,
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
        title: Text("Detalle Orden"),
        // actions: [Stack(child: Image.asset("assets/images/chinchin_icon_white.png"))],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)));
  }
}
