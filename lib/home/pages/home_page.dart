import 'package:chinchin_merchant/common/widgets/navigation_bar_type1.dart';
import 'package:chinchin_merchant/home/widgets/card_list.dart';

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
          body: Container(
            width: double.infinity,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _navigationBar(sizes: size),
                _bottomNavigationBar(),
                _homeWidget(context),
              ],
            ),
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

  _homeWidget(contextScafoll) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CardList(),
        ),
        IconButton(
            onPressed: () {
              Scaffold.of(contextScafoll).openDrawer();
            },
            icon: Icon(Icons.present_to_all)),
        // Expanded(
        //   child: ListView.builder(
        //       // shrinkWrap: true,
        //       // scrollDirection: Axis.horizontal,
        //       itemCount: 3,
        //       itemBuilder: (context, index) {
        //         return ListTile(
        //           minLeadingWidth: 10,
        //           title: Text("dasa"),
        //         );
        //       }),
        // ),
        // ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 4,
        //     itemBuilder: (context, index) {
        //       return Card(
        //         child: Icon(Icons.wallet_travel),
        //       );
        //     }),
        Container(
          width: double.infinity,
          height: 300,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {},
                    title: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width - 50,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.card_giftcard),
                          Column(
                            children: [
                              Text("gadgad"),
                            ],
                          )
                        ],
                      ),
                    ));
              }),
        )
      ],
    );
  }

  _drawer() {
    // var vinculacionBloc = BlocProvider.of<VinculacionBloc>(context);
    // var user = vinculacionBloc.users.first;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Icon(Icons.account_circle, size: 70),
                    )),
                Expanded(
                    child: Text(
                  'Angel',
                  style: TextStyle(fontSize: 12),
                )),
                Expanded(
                    child: Text(
                  "Última sesión ",
                  style: TextStyle(fontSize: 12),
                ))
              ],
            ),
            decoration: BoxDecoration(),
          ),
          /*ListTile(
            title: Text('Compartir mis datos'),
            onTap: () {
              _openQrData();
            },
          ),*/
          ListTile(
            title: Text('Configuración'),
            onTap: () {
              //Navegar a la página de configuraciones
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/config');
            },
          ),
          ListTile(
            title: Text('Salir'),
            onTap: () {
              // _showExitDialog();
            },
          ),
        ],
      ),
    );
  }

  _bottomNavigationBar() {
    return Positioned(
        bottom: 0,
        child: Container(
            child: Column(
          children: [
            Container(child: Text("Chinchin")),
          ],
        )));
  }

  _navigationBar({required Size sizes}) {
    return Positioned(
        top: 0,
        child: CustomAppBar(
          size: sizes,
        ));
  }
}
