import 'package:chinchin_merchant/common/widgets/rounded_text_field_container.dart';
import 'package:chinchin_merchant/home/pages/home_page.dart';
import 'package:chinchin_merchant/home/pages/home_screen.dart';
import 'package:chinchin_merchant/login_registro/pages/registro.dart';
import 'package:chinchin_merchant/login_registro/widgets/background_login.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final email = TextEditingController();

  final password = TextEditingController();

  bool obscuredVarible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
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
            SizedBox(height: size.height * 0.05),
            ButtonTheme(
              minWidth: size.width,
              height: size.width / 3,

              // ignore: deprecated_member_use
              child: new CupertinoButton(
                  key: null,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => MenuProvider(),
                        child: HomeScreen(),
                      ),
                    ));
                  },
                  color: primaryLightColor,
                  child: new Text(
                    "Login",
                    style: new TextStyle(
                        fontSize: size.width / 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: "JLSDataGothic-CNC"),
                  )),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Text("Don't have an account? Sign Up",
                    style: TextStyle(color: primaryLightColor, fontSize: 17)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
