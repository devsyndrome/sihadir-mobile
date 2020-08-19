import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sihadir/constant.dart';

// import 'components/body.dart';
import 'package:qrscan/qrscan.dart';
// import 'package:sihadir/components/search_box.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

class ProductsScreen extends StatelessWidget {
  final String username;
  String data = "QR Result";
  //constructor
  ProductsScreen({Key key, @required this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SvgPicture.asset(
            //   "assets/icons/logoc.svg",
            //   height: size.height * 0.30,
            // ),
            Text(
              "SCAN QR Code",
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
            // Text(
            //   username,
            //   style: TextStyle(fontSize: 20),
            // ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          this.scanQR(context);
        },
        label: Text('Scan'),
        icon: Icon(Icons.camera_alt),
        backgroundColor: kPrimaryColor,
      ),
      // Body(
      //   username: username,
      // ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text('SiHADIR Scanner'),
      actions: <Widget>[
        // IconButton(
        //   icon: SvgPicture.asset("assets/icons/notification.svg"),
        //   onPressed: () {},
        // ),
      ],
    );
  }

  void scanQR(BuildContext context) async {
    String scanResult = await scan();
    // setState(() {
    //   data = scanResult;
    // });
    // Alert(
    //         context: context,
    //         title: username,
    //         type: AlertType.success,
    //         desc: "Data correct.")
    //     .show();
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(message: "Loading..");
    progressDialog.show();

    final response = await http
        .post('http://192.168.43.43/sihadir/public/api/generate', body: {
      'userscan': scanResult,
      'username': username,
    }, headers: {
      'Accept': 'application/json'
    });
    progressDialog.hide();
    if (response.statusCode == 201) {
      Alert(
              context: context,
              title: "Presence Success",
              type: AlertType.success,
              buttons: [
            DialogButton(
                child: Text("OK", style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.pop(context))
          ])
          // desc: "Data correct.")
          .show();
      // Navigator.pushReplacementNamed(context, 'dashboard');
    } else if (response.statusCode == 400) {
      Alert(
          context: context,
          title: "Presence failed",
          type: AlertType.warning,
          buttons: [
            DialogButton(
                child: Text("OK", style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.pop(context))
          ]).show();
    } else if (response.statusCode == 406) {
      Alert(
          context: context,
          title: "You already presence, enjoy the class.",
          type: AlertType.warning,
          buttons: [
            DialogButton(
                child: Text("OK", style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.pop(context))
          ]).show();
    } else if (response.statusCode == 403) {
      Alert(
          context: context,
          title: "QR Expired.",
          type: AlertType.warning,
          buttons: [
            DialogButton(
                child: Text("OK", style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.pop(context))
          ]).show();
    } else if (response.statusCode == 401) {
      Alert(
          context: context,
          title: "Is not your class.",
          type: AlertType.warning,
          buttons: [
            DialogButton(
                child: Text("OK", style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.pop(context))
          ]).show();
    }
  }
}
