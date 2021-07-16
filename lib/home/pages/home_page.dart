import 'package:chinchin_merchant/common/pages/comprobante.dart';
import 'package:chinchin_merchant/common/widgets/bottom_sheet.dart';
import 'package:chinchin_merchant/common/widgets/navigation_bar_type1.dart';
import 'package:chinchin_merchant/home/models/card_model.dart';
import 'package:chinchin_merchant/home/widgets/card_design.dart';
import 'package:chinchin_merchant/home/widgets/card_list.dart';
import 'package:chinchin_merchant/p2p/pages/pago_movil.dart';
import 'package:chinchin_merchant/pago_chinchin/pages/pago_chinchin.dart';
import 'package:chinchin_merchant/utils/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final rtl = ZoomDrawer.isRTL();
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context)!.stateNotifier!,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: GestureDetector(
        child: Scaffold(
          appBar: _appBarGreen(size),
          bottomNavigationBar: _bottomNavigationBar(size),
          body: Container(
            color: backgroundColorLight,
            height: size.height,
            child: _homeWidget(context, size),
          ),
        ),
        onPanUpdate: (details) {
          if (details.delta.dx < 6 && !rtl || details.delta.dx < -6 && rtl) {
            ZoomDrawer.of(context)!.toggle();
          }
        },
      ),
    );
  }

  _homeWidget(contextScafoll, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Funciones"),
            )
          ],
        ),
        // CardList(),
        Expanded(
          flex: 1,
          child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: CardDesign(
                      card: cards[index],
                    ),
                    onTap: () {
                      print("Seleccionaste $index");
                      index == 0
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PagoMovilPage()))
                          : print("otro valor");
                      index == 1
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PagoChinchinPage()))
                          : print("otro valor");

                      // Navigator.of(context).push(route);
                    },
                  ),
                );
              }),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Actividades Recientes"),
            )
          ],
        ),
        Expanded(
          flex: 2,
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
                              children: [Icon(Icons.transfer_within_a_station)],
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
    );
  }

  _bottomNavigationBar(Size size) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(60))),
      height: size.height / 12,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.home)),
              IconButton(onPressed: () {}, icon: Icon(Icons.history)),
              IconButton(onPressed: () {}, icon: Icon(Icons.person)),
              IconButton(onPressed: () {}, icon: Icon(Icons.card_giftcard)),
            ],
          ),
        ],
      ),
    );
  }

  _appBarGreen(Size size) {
    return AppBar(
      leadingWidth: 220,
      foregroundColor: primaryLightColor,
      backgroundColor: primaryLightColor,
      shape: ContinuousRectangleBorder(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(90.0),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Hello, Moto Rocker",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decorationStyle: TextDecorationStyle.dashed),
          ),
        )
      ],
      leading: Stack(
        children: [
          Positioned(
            top: 0,
            left: 10,
            child: Container(
              child: Image.asset(
                'assets/images/chinchin_icon_white_with_opacity.png',
                height: 40,
                width: 40,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                // if (details.delta.dx < 6 && !rtl || details.delta.dx < -6 && rtl) {
                ZoomDrawer.of(context)!.toggle();
                // }
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
