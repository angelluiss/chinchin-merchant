import 'package:chinchin_merchant/common/style/custom/circle_left_custom_paint.dart';
import 'package:chinchin_merchant/common/widgets/app_bar/app_bar_white_green.dart';
import 'package:chinchin_merchant/common/widgets/rounded_text_field_container.dart';
import 'package:chinchin_merchant/p2p/pages/cobro_chinchin_pago_mobil.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PagoMovilPage extends StatefulWidget {
  PagoMovilPage({Key? key}) : super(key: key);

  @override
  _PagoMovilPageState createState() => _PagoMovilPageState();
}

class _PagoMovilPageState extends State<PagoMovilPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWhiteGree(
        size: size,
      ),
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
                      child: Text("Introducir Datos",
                          style: TextStyle(color: Colors.black45)),
                    ),
                  ],
                ),
                RoundedInputField(
                  hintText: "Nuevo Pedido",
                ),
                RoundedInputField(
                  hintText: "Monto de Pedido",
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black12,
                      height: 1,
                      width: size.width - 80,
                    )),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Nombre",
                          style: TextStyle(color: Colors.black45)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Manuel Rodriguez",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Telefono",
                          style: TextStyle(color: Colors.black45)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("+58 414 3903799",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Banco",
                          style: TextStyle(color: Colors.black45)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Banco Plaza",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
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
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
                      child: Text("Total a pagar",
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CobroP2P(),
                          ),
                        );
                      },
                      color: primaryLightColor,
                      child: new Text(
                        "Siguiente",
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
}
