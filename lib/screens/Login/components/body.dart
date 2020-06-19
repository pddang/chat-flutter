import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/components/account_check.dart';
import 'package:flutter_chat_ui_starter/components/round_button.dart';
import 'package:flutter_chat_ui_starter/components/round_input_field.dart';
import 'package:flutter_chat_ui_starter/components/round_password_input_field.dart';
import 'package:flutter_chat_ui_starter/screens/Signup/signup_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03,),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.03,),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(onChanged: (value) {}),
            RoundButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03,),
            AccountCheck(press: (){Navigator.push(context, MaterialPageRoute(builder: (context){ return SignUpScreen();}));},)
          ],
        ),
      ),
    );
  }
}

