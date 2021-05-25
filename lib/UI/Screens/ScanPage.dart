import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:provider/provider.dart';
import 'package:lessmess/UI/Provider/number.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              onPressed: () async {
                // bool res = Provider.of<Number>(context, listen: false).didLeave;
                // if (res == false) {
                //   Fluttertoast.showToast(
                //       msg: "You need to exit first to Scan a New QR Code",
                //       toastLength: Toast.LENGTH_SHORT,
                //       gravity: ToastGravity.CENTER,
                //       timeInSecForIosWeb: 1,
                //       backgroundColor: Colors.red,
                //       textColor: Colors.white,
                //       fontSize: 16.0);
                // } else {
                var options =
                    ScanOptions(android: AndroidOptions(useAutoFocus: true));
                var codeSanner = await BarcodeScanner.scan(
                    options: options); //barcode scnner
                // setState(() {
                //   qrCodeResult = codeSanner.rawContent;
                // });
                if (codeSanner.type == ResultType.Error ||
                    codeSanner.type == ResultType.Cancelled) {
                  setState(() {
                    qrCodeResult = 'There was an error';
                  });
                } else {
                  //      Provider.of<Number>(context, listen: false).entered();
                  FirebaseFirestore.instance
                      .collection('mess')
                      .doc('fc1')
                      .update({'count': FieldValue.increment(1)});
                  setState(() {
                    qrCodeResult = 'Token No. 12a-trg3-123';
                  });
                }
              }
              // try{
              //   BarcodeScanner.scan()    this method is used to scan the QR code
              // }catch (e){
              //   BarcodeScanner.CameraAccessDenied;   we can print that user has denied for the permisions
              //   BarcodeScanner.UserCanceled;   we can print on the page that user has cancelled
              // }
              //           }
              ,
              child: Text(
                "Open Scanner",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 3.0),
                  borderRadius: BorderRadius.circular(20.0)),
            )
          ],
        ),
      ),
    );
  }

  //its quite simple as that you can use try and catch staatements too for platform exception
}
