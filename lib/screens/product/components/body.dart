import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';
// import 'package:sihadir/components/search_box.dart';
import 'package:sihadir/constant.dart';
import 'package:sihadir/models/product.dart';
import 'package:sihadir/screens/details/details_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:sihadir/screens/product/products_screen.dart';

// import 'category_list.dart';
// import 'product_card.dart';

// class Body extends StatefulWidget {
//   String data = "QR Result";
//   @override
//   Widget build(BuildContext context) {

//   }

//   void scanQR(BuildContext context) async {
//     String scanResult = await scan();
//     setState(() {
//       data = scanResult;
//     });
//     // ProgressDialog progressDialog = ProgressDialog(context);
//     // progressDialog.style(message: "Loading..");
//     // progressDialog.show();

//     //   final response = await http
//     //       .post('http://192.168.43.43/sihadir/public/api/generate', body: {
//     //     'userscan': scanResult,
//     //   }, headers: {
//     //     'Accept': 'application/json'
//     //   });
//     //   progressDialog.hide();
//     //   if (response.statusCode == 201) {
//     //     Alert(
//     //             context: context,
//     //             title: "Presence Success",
//     //             type: AlertType.success,
//     //             buttons: [DialogButton(child: Text("OK"), onPressed: null)])
//     //         // desc: "Data correct.")
//     //         .show();
//     //     Navigator.pushReplacementNamed(context, 'dashboard');
//     //   } else {
//     //     Alert(
//     //             context: context,
//     //             title: "Presence Failed",
//     //             type: AlertType.warning,
//     //             desc: "Fail.")
//     //         .show();
//     //   }
//   }

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

class Body extends StatefulWidget {
  final String username;

  //constructor
  Body({Key key, @required this.username}) : super(key: key);

  @override
  _BodyState createState() => _BodyState(username: username);
}

String data = "QR Result";

class _BodyState extends State<Body> {
  final String username;

  //constructor
  _BodyState({Key key, @required this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Floating Action Button Label'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              username,
              style: TextStyle(fontSize: 20),
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
        backgroundColor: Color(0xFF0352a1),
      ),
    );

    //   return SafeArea(
    //     bottom: false,

    //     child: Column(
    //       children: <Widget>[
    //         // SearchBox(onChanged: (value) {}),
    //         // CategoryList(),

    //         SizedBox(height: kDefaultPadding / 2),
    //         Expanded(
    //           child: Stack(
    //             children: <Widget>[
    //               // Our background
    //               Container(
    //                 margin: EdgeInsets.only(top: 70),
    //                 decoration: BoxDecoration(
    //                   color: kBackgroundColor,
    //                   borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(40),
    //                     topRight: Radius.circular(40),
    //                   ),
    //                 ),
    //               ),
    //               ListView.builder(
    //                 // here we use our demo procuts list
    //                 itemCount: products.length,
    //                 itemBuilder: (context, index) => ProductCard(
    //                   itemIndex: index,
    //                   product: products[index],
    //                   press: () {
    //                     Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) => DetailsScreen(
    //                           product: products[index],
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
  }

  void scanQR(BuildContext context) async {
    String scanResult = await scan();
    setState(() {
      data = scanResult;
    });
    Alert(
            context: context,
            title: username,
            type: AlertType.success,
            desc: "Data correct.")
        .show();
    // ProgressDialog progressDialog = ProgressDialog(context);
    // progressDialog.style(message: "Loading..");
    // progressDialog.show();

    //   final response = await http
    //       .post('http://192.168.43.43/sihadir/public/api/generate', body: {
    //     'userscan': scanResult,
    //   }, headers: {
    //     'Accept': 'application/json'
    //   });
    //   progressDialog.hide();
    //   if (response.statusCode == 201) {
    //     Alert(
    //             context: context,
    //             title: "Presence Success",
    //             type: AlertType.success,
    //             buttons: [DialogButton(child: Text("OK"), onPressed: null)])
    //         // desc: "Data correct.")
    //         .show();
    //     Navigator.pushReplacementNamed(context, 'dashboard');
    //   } else {
    //     Alert(
    //             context: context,
    //             title: "Presence Failed",
    //             type: AlertType.warning,
    //             desc: "Fail.")
    //         .show();
    //   }
  }
}
