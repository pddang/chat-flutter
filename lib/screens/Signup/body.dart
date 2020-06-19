import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/components/or_divider.dart';
import 'package:flutter_chat_ui_starter/components/social_icons.dart';
import 'package:flutter_chat_ui_starter/screens/Login/login_screen.dart';
import 'package:flutter_chat_ui_starter/screens/Signup/background.dart';
import 'package:flutter_chat_ui_starter/components/account_check.dart';
import 'package:flutter_chat_ui_starter/components/round_button.dart';
import 'package:flutter_chat_ui_starter/components/round_input_field.dart';
import 'package:flutter_chat_ui_starter/components/round_password_input_field.dart';
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
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.3,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(onChanged: (value) {}),
            RoundButton(
              text: "SIGN UP",
              press: () {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AccountCheck(
              login: false,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcons(iconSrc: "assets/icons/facebook.svg",),
                SocialIcons(iconSrc: "assets/icons/twitter.svg",),
                SocialIcons(iconSrc: "assets/icons/google-plus.svg",),
                ],
            )
          ],
        ),
      ),
    );
  }
}

