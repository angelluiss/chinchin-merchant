import 'package:chinchin_merchant/common/widgets/navigation_bar_type1.dart';
import 'package:chinchin_merchant/home/widgets/card_list.dart';
import 'package:chinchin_merchant/login_registro/widgets/custom_app_called.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _navigationBar(sizes: size),
            _bottomNavigationBar(),
            _homeWidget(),
          ],
        ),
      ),
    );
  }

  _homeWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CardList(),
        ),
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
