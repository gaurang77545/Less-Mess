import 'package:barcode_scan2/gen/protos/protos.pbenum.dart';
import 'package:barcode_scan2/model/android_options.dart';
import 'package:barcode_scan2/model/scan_options.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QrScreen extends StatefulWidget {
  static const routeName = './QRScreen';

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.qr_code_scanner_sharp,
                color: Colors.black,
                size: 200.0),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      color: Color(0xFF6F35A5),
      onPressed: () async {
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

      },
      child: Text(
        'Scan QR Code',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF6F35A5), width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    ),
            SizedBox(
              height: 20.0,
            ),
       /*     FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>GeneratePage()));
        
      },
      child: Text(
        ' Generate QR Code',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    )*/
          ],
        ),
      ),
    );
  }
}
