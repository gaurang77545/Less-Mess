import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lessmess/UI/Provider/number.dart';
import 'package:nice_button/nice_button.dart';
import 'package:lessmess/UI/Screens/GenerateCode.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExitScreen extends StatelessWidget {
  static const routeName = './ExitScreen';
  @override
  Widget build(BuildContext context) {
    var firstColor = Colors.black, secondColor = Colors.black;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 0,
          child: NiceButton(
              background: Colors.lightGreen,
              fontSize: 17,
              radius: 30,
              padding: const EdgeInsets.all(15),
              text: "Show Mess Credentials",
              icon: Icons.qr_code_outlined,
              gradientColors: [secondColor, firstColor],
              onPressed: () async {
                /*               bool res = Provider.of<Number>(context, listen: false).didLeave;
                if (res == false) {
                  Fluttertoast.showToast(
                      msg: "You need to exit first to Generate a New QR Code",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                      */
//                } else {
      //          Provider.of<Number>(context, listen: false)
       //             .setregno(180953250);
//                 Provider.of<Number>(context, listen: false).increaseCount();
    //            Provider.of<Number>(context, listen: false).entered();
                Navigator.of(context).push(
                  new  MaterialPageRoute(builder: (context) => GeneratePage()));
//                }
              }),
        ),
        Positioned(
          right: 30,
          bottom: 60,
          child: FloatingActionButton.extended(
            label: Text("Leave"),
            icon: Icon(Icons.leave_bags_at_home),
            onPressed: () {
              // bool res = Provider.of<Number>(context, listen: false).didLeave;
              // if (res == true) {
              //   Fluttertoast.showToast(
              //       msg: "You can't leave without generating a new QR Code",
              //       toastLength: Toast.LENGTH_SHORT,
              //       gravity: ToastGravity.CENTER,
              //       timeInSecForIosWeb: 1,
              //       backgroundColor: Colors.red,
              //       textColor: Colors.white,
              //       fontSize: 16.0);
              // } else {
                FirebaseFirestore.instance
                    .collection('mess')
                    .doc('fc1')
                    .update({
                      'count' : FieldValue.increment(-1)
                    });
               // Provider.of<Number>(context, listen: false).left();
               // print(Provider.of<Number>(context, listen: false).number);
              }
            ,
          ),
        ),
      ]),
    );
  }
}
