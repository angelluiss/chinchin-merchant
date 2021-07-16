import 'package:chinchin_merchant/common/pages/cobro_de_orden.dart';
import 'package:chinchin_merchant/common/style/custom/circle_left_custom_paint.dart';
import 'package:chinchin_merchant/common/widgets/rounded_text_field_container.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CobroP2P extends StatefulWidget {
  CobroP2P({Key? key}) : super(key: key);

  @override
  _CobroP2PState createState() => _CobroP2PState();
}

class _CobroP2PState extends State<CobroP2P> {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
                      child: Text("Informacion Bancaria",
                          style: TextStyle(color: Colors.black45)),
                    ),
                  ],
                ),
                RoundedInputField(
                  hintText: "Banco",
                ),
                RoundedInputField(
                  hintText: "Referencia",
                ),
                RoundedInputField(
                  hintText: "Monto a pagar",
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
                      child: Text("Total a cobrar",
                          style:
                              TextStyle(fontSize: 20, color: Colors.black45)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Bs 250.000.000,00",
                          style: TextStyle(
                              fontSize: 30, color: primaryLightColor)),
                    ),
                  ],
                ),
                ButtonTheme(
                  minWidth: size.width,
                  height: size.width / 3,

                  // ignore: deprecated_member_use
                  child: new CupertinoButton(
                      key: null,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CobrodeOrden(),
                        ));
                      },
                      color: primaryLightColor,
                      child: new Text(
                        "Cobrar",
                        style: new TextStyle(
                            fontSize: size.width / 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: "JLSDataGothic-CNC"),
                      )),
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
        title: Text("Orden Pago Movil"),
        // actions: [Stack(child: Image.asset("assets/images/chinchin_icon_white.png"))],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)));
  }
}
