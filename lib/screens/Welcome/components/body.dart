import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/components/round_button.dart';
import 'package:flutter_chat_ui_starter/constants.dart';
import 'package:flutter_chat_ui_starter/screens/Login/login_screen.dart';
import 'package:flutter_chat_ui_starter/screens/Signup/signup_screen.dart';
import 'package:flutter_chat_ui_starter/screens/Welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to ChatApp",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundButton(
              text: "LOGIN",
              textColor: Colors.white,
              press: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              },));},
            ),
            RoundButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: (){Navigator.push(context, MaterialPageRoute(builder: (context){ return SignUpScreen();}));},
            ),
          ],
        ),
      ),
    );
  }
}
