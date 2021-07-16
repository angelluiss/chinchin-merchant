import 'package:chinchin_merchant/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ComprobantePage extends StatefulWidget {
  ComprobantePage({Key? key}) : super(key: key);

  @override
  _ComprobantePageState createState() => _ComprobantePageState();
}

class _ComprobantePageState extends State<ComprobantePage> {
  double? screenHeight, screenWidth;
  double fontSizeTitle = 18, fontSizeContent = 18;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    fontSizeTitle = screenWidth! / textComprobanteDescription;
    fontSizeContent = screenWidth! / textComprobanteTittle;
    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(80.0),
          ),
        ),
        title: Text("Datos de la orden"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                margin: EdgeInsets.only(right: 10),
                child:
                    Image.asset("assets/images/logo_chinchin_solo_green.png")),
          )
        ],
      ),
      body: Container(
        decoration: new BoxDecoration(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.grey[850]
                : backgroundColorLight),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          _content(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // if (widget.data.monto != '')
          ],
        ),
      ),
    );
  }

  _titulo() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "widget.data.titulo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _content() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Divider(),
          _titulo(),
          // if (widget.data.descripcion != '')
          _descripcion(),
          _succesIcon(),
          _fecha(),
          // if (widget.data.comprobante != '')
          _numeroComprobante(),
          // if (widget.data.nombre != '')
          _nombre(),
          // if (widget.data.operadora != '')
          _operadora(),
          // if (widget.data.banco != '')
          _banco(),
          // if (widget.data.origen != '')
          _origenValue(),
          // if (widget.data.destino != '')
          _destinoValue(),
          // if (widget.data.identification != '')
          _identification(),
          Container(
              margin: EdgeInsets.only(top: 40),
              child: Divider(
                height: 10,
              )),
          _montoValue(),

          // if (widget.data.concepto != '') _concepto(),
        ],
      ),
    );
  }

  _succesIcon() {
    return Center(
      child: Icon(
        Icons.check_circle,
        size: 30,
        color: primaryLightColor,
      ),
    );
  }

  _fecha() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Fecha: ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: fontSizeTitle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              formatter.format(now).toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: fontSizeContent, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  _operadora() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Operadora: ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: fontSizeTitle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              " widget.data.operadora",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: fontSizeContent, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  _descripcion() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "Transacción realizada con éxito",
          style:
              TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _banco() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Banco: ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: fontSizeTitle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "widget.data.banco",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: fontSizeContent, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  _numeroComprobante() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Referencia: ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: fontSizeTitle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "widget.data.comprobante",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: fontSizeContent, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  _nombre() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Cliente: ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: fontSizeTitle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "widget.data.nombre",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: fontSizeContent, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  _identification() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Identificación: ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: fontSizeTitle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              " widget.data.identification",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: fontSizeContent, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  _origenValue() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Instrumento origen: ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: fontSizeTitle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "widget.data.origen",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: fontSizeContent, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  _destinoValue() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Instrumento destino: ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: fontSizeTitle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "widget.data.destino",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: fontSizeContent, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  _montoValue() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "Monto: ",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: fontSizeTitle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "\$ 10.00",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: primaryLightColor),
              ),
            )
          ]),
    );
  }
}
