import 'package:flutter/material.dart';

import './components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = './WelcomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
