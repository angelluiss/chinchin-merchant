import 'package:chinchin_merchant/login_registro/widgets/body_register.dart';
import 'package:chinchin_merchant/login_registro/widgets/custom_app_called.dart';
import 'package:chinchin_merchant/login_registro/widgets/custom_toolbar_shape.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyRegister(),
    );

    // return NestedScrollView(
    //   physics: NeverScrollableScrollPhysics(),
    //   controller: this._scrollController1,
    //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //     return <Widget>[
    //       SliverPersistentHeader(
    //           floating: false,
    //           pinned: false,
    //           delegate: CustomToolbar(
    //             height: size.height / 7,
    //           ))
    //     ];
    //   },
    //   body: Scaffold(
    //     body: BodyRegister(),
    //   ),
    // );
  }
}
