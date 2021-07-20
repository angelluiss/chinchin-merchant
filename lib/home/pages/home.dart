import 'package:chinchin_merchant/home/screen/drawerScreen.dart';
import 'package:chinchin_merchant/home/pages/pager_page_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(), PageViewver()],
      ),
    );
  }
}
