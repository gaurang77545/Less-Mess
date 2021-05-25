import 'package:flutter/material.dart';
import 'package:lessmess/UI/Screens/description.dart';
import 'package:lessmess/UI/Screens/tabscreen.dart';
import 'package:lessmess/Screens/Welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
//  FirebaseUser user = FirebaseAuth.instance.currentUser;
  //print('$user');
  runApp(
      new MaterialApp(
        home: new WelcomeScreen(),
      )

  );
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
             AppBar(
            title: Text('Menu'),
               backgroundColor: Colors.redAccent,
            automaticallyImplyLeading: false,
          ),
          // Container(
          //   height: 120,
          //   width: double.infinity,
          //   padding: EdgeInsets.all(20),
          //   alignment: Alignment.centerLeft,
          //   color: Theme.of(context).accentColor,
          //   //If you are using decoration here then set color using that else there will be an error in flutter
          //   child: Text(
          //     'Less Mess',
          //     style: TextStyle(
          //         fontWeight: FontWeight.w900, //Sets the font weight to 900
          //         fontSize: 30,
          //         color: Theme.of(context).primaryColor),
          //   ),
          // ),
          ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text('Info'),
            onTap: () {
              Navigator.of(context).pushNamed(Description.routename);
            },
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed(TabScreen.routeName);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 280,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: _signOut
          )
        ],
      ),
    );
  }
}
