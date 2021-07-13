import 'package:chinchin_merchant/common/widgets/rounded_text_field_container.dart';
import 'package:chinchin_merchant/login_registro/widgets/background_register.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyRegister extends StatefulWidget {
  @override
  _BodyRegisterState createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  final email = TextEditingController();

  final password = TextEditingController();

  bool obscuredVarible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundRegister(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo_chinchin.png",
              fit: BoxFit.scaleDown,
              width: size.width * 0.35,
              height: 130.0,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email",
            ),
            RoundedInputField(
              hintText: "Password",
            ),
            RoundedInputField(
              hintText: "Repeat Password",
            ),
            SizedBox(height: size.height * 0.05),
            ButtonTheme(
              minWidth: size.width,
              height: size.width / 3,
              child: new CupertinoButton(
                  key: null,
                  onPressed: () {},
                  color: primaryLightColor,
                  child: new Text(
                    "Registro",
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
    );
  }
}
