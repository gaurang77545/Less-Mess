import 'package:flutter/material.dart';
import 'package:lessmess/UI//Widgets/AppDrawer.dart';
import 'package:provider/provider.dart';
import 'package:lessmess/UI/Provider/number.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';
class Description extends StatelessWidget {
  static const routename = './Description';

  @override
  Widget build(BuildContext context) {
 //   int regno = Provider.of<Number>(context).regno;
 DateTime now = DateTime.now();
 String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    return Scaffold(
        appBar: AppBar(
          title: Text('Less Mess'),
        ),
        drawer: AppDrawer(),
        // body: regno == null
        //     ? Center(child: Column(
        //       children: [
        //         Image.asset('assets/waiting.jpg'),
        //         Text('Nothing Generated Till Now',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold ,color: Theme.of(context).accentColor),textAlign: TextAlign.center,),
        //       ],
        //     ))
        //     : 
        body:Column(
              children: [
                QrImage(data: '180953250'+DateTime.now().toIso8601String()),
                 Text('180953250'+'\n'+formattedDate,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold )
                  ) ],
            ));
  }
}
