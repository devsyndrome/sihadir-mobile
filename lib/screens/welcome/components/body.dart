import 'package:flutter/material.dart';
import 'package:sihadir/Screens/Login/login_screen.dart';
// import 'package:sihadir/Screens/Signup/signup_screen.dart';
import 'package:sihadir/Screens/Welcome/components/background.dart';
import 'package:sihadir/Screens/Welcome/components/rounded_button.dart';
import 'package:sihadir/constant.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0352a1),
                  fontSize: 20),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/logoc.svg",
              height: size.height * 0.30,
            ),
            Text(
              'SIHADIR Apps',
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = Colors.blue[700],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            // RoundedButton(
            //   text: "LOGIN",
            //   color: kPrimaryLightColor,
            //   textColor: Colors.black,
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           // return SignUpScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
