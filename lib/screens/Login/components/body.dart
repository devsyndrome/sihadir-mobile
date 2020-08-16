import 'package:flutter/material.dart';
import 'package:sihadir/Screens/Login/components/background.dart';
// import 'package:sihadir/Screens/Signup/signup_screen.dart';
// import 'package:sihadir/Screens/Welcome/components/already_have_an_account_acheck.dart';
import 'package:sihadir/Screens/Welcome/components/rounded_input_field.dart';
import 'package:sihadir/Screens/Welcome/components/rounded_password_field.dart';
import 'package:sihadir/Screens/Welcome/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

class Body extends StatelessWidget {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

  Body({
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
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/logoc.svg",
              height: size.height * 0.35,
            ),
            Text(
              "SIGN IN TO",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0352a1),
                  fontSize: 20),
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
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              myController: txtUsername,
              hintText: "Your Students ID Number",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              myController: txtPassword,
              onChanged: (value) {},
            ),
            RoundedButton(
                text: "LOGIN",
                press: () {
                  this._doLogin(context);
                }),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  Future _doLogin(BuildContext context) async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(
              context: context,
              title: "Login Failed",
              type: AlertType.warning,
              desc: "Field cannot be empty.")
          .show();
      return;
    }
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(message: "Loading..");
    progressDialog.show();
    final response = await http.post(
        'http://192.168.43.43/sihadir/public/api/login',
        body: {'username': txtUsername.text, 'password': txtPassword.text},
        headers: {'Accept': 'application/json'});
    progressDialog.hide();
    if (response.statusCode == 200) {
      Alert(
              context: context,
              title: "Login Success",
              type: AlertType.success,
              desc: "Data correct.")
          .show();
    } else {
      Alert(
              context: context,
              title: "Login Failed",
              type: AlertType.warning,
              desc: "Data not registered in our system.")
          .show();
    }
  }
}
