import 'package:chinchin_merchant/historial/pages/history.dart';
import 'package:chinchin_merchant/home/screen/home_screen.dart';
import 'package:chinchin_merchant/p2p/pages/pago_movil.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageViewver extends StatefulWidget {
  PageViewver({Key? key}) : super(key: key);

  @override
  _PageViewverState createState() => _PageViewverState();
}

class _PageViewverState extends State<PageViewver>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();

  List<Widget> screens = [
    ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: HomeScreen(),
    ),
    HistorialPage(),
    PagoMovilPage(),

    // UserSearchTempPage()
  ];

  int _selectedIndex = 0;
  _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _onItemTapped(int selectedIndex) {
    // _pageController.jumpToPage(selectedIndex);
    _pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 400), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _home(context);
  }

  Widget _home(context) {
    final fullwidth = MediaQuery.of(context).size;

    return Scaffold(
        body: PageView(
          controller: _pageController,
          children: screens,
          onPageChanged: _onPageChanged,
          physics: AlwaysScrollableScrollPhysics(),
        ),
        bottomNavigationBar: _bottomNavigationBar(fullwidth));
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
              IconButton(
                  onPressed: () {
                    _onItemTapped(0);
                  },
                  icon: Icon(Icons.home)),
              IconButton(
                  onPressed: () {
                    _onItemTapped(1);
                  },
                  icon: Icon(Icons.history)),
              IconButton(
                  onPressed: () {
                    _onItemTapped(2);
                  },
                  icon: Icon(Icons.person)),
              IconButton(
                  onPressed: () {
                    _onItemTapped(3);
                  },
                  icon: Icon(Icons.card_giftcard)),
            ],
          ),
        ],
      ),
    );
  }

  //Metodo para comprobar la conexion a internet
  // Future<bool> _checkInternetConection() async {
  //   try {
  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       print('connected');
  //       return true;
  //     }
  //   } on SocketException catch (_) {
  //     print('not connected');
  //     return false;
  //   }
  //   return false;
  // }
}