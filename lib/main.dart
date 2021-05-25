
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'package:lessmess/Screens/Welcome/welcome_screen.dart';
import 'package:lessmess/UI/Provider/number.dart';
import 'package:lessmess/UI/Screens/counterscreen.dart';
import 'package:lessmess/UI/Screens/description.dart';
import 'package:lessmess/UI/Screens/exitscreen.dart';
import 'package:lessmess/UI/Screens/qrscreen.dart';
import 'package:provider/provider.dart';

import 'Screens/Welcome/welcome_screen.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'UI/Screens/tabscreen.dart';
import 'UI/Screens/tabscreen.dart';
//Lessmess


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Number(),
            child: MaterialApp(
        title: 'Token',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            //  fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1:
                      TextStyle(color: Color.fromRGBO(20, 51, 51, 1)), //h1 tag
                  bodyText2:
                      TextStyle(color: Color.fromRGBO(20, 51, 51, 1)), //h2 tag
                  headline6: TextStyle(
                      //  fontFamily: 'RoboCondensed',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.dark().textTheme.copyWith(
                    bodyText1:
                        TextStyle(color: Color.fromRGBO(20, 51, 51, 1)), //h1 tag
                    bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                    headline6:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))),
        home: WelcomeScreen(),
        routes: {
        Counter.routeName:(ctx)=>Counter(),
        TabScreen.routeName:(ctx)=>TabScreen(),
        QrScreen.routeName:(ctx)=>QrScreen(),
        ExitScreen.routeName:(ctx)=>ExitScreen(),
        Description.routename:(ctx)=>Description()
        },
        
      ),
    );
  }
}

