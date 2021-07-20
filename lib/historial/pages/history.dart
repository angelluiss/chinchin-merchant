import 'package:chinchin_merchant/common/pages/comprobante.dart';
import 'package:chinchin_merchant/common/style/custom/circle_left_custom_paint.dart';
import 'package:chinchin_merchant/common/widgets/app_bar/app_bar_white_green.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/material.dart';

class HistorialPage extends StatefulWidget {
  HistorialPage({Key? key}) : super(key: key);

  @override
  _HistorialPageState createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarWhiteGree(
        size: size,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 311,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xfff5f7fa),
                  width: 1,
                ),
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ComprobantePage()));
                      },
                      title: Container(
                          height: size.height / 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border: Border.all(color: primaryLightColor),
                          ),
                          width: MediaQuery.of(context).size.width - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.transfer_within_a_station)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "01254123541",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Orden de un posillo",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$15",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          )));
                }),
          )
        ],
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
}
