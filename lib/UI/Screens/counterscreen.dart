import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lessmess/UI//Provider/number.dart';

class Counter extends StatefulWidget {
  static const routeName = './Counter';

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  List<bool> isSelected = [false, true, false];
  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  FocusNode focusNodeButton3 = FocusNode();
  List<FocusNode> focusToggle;
  Stream _stream;
  @override
  void initState() {
    super.initState();
    focusToggle = [focusNodeButton1, focusNodeButton2, focusNodeButton3];
    _stream =
        FirebaseFirestore.instance.collection('mess').doc('fc1').snapshots();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNodeButton1.dispose();
    focusNodeButton2.dispose();
    focusNodeButton3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //   List<bool> isSelected = [false, true, false];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Center(

                child: Text('Current Status:',
                    style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Stack(children: [
              Container(

                margin: EdgeInsets.all(60.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightGreen, width: 2),
                    shape: BoxShape.circle),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 120,
                                              child: StreamBuilder(
                            stream: _stream,
                            builder: (ctx, snapshot) {
                              return Text(snapshot.data['count'].toString(),style: TextStyle(fontSize: 100, color: Colors.redAccent),);
                            }),
                      ),
                      Center(
                        child: Text(
                          '/500',
                          style: TextStyle(fontSize: 25, color: Colors.redAccent),
                        ),
                      )
                    ],
                  ),
                
              ),
            ]),
          )
                ]),
          );
  }
}
