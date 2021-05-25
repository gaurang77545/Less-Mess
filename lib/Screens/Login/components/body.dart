import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../UI/Screens/tabscreen.dart';
import '../../../components/rounded_input_field.dart';
import '../../Welcome/welcome_screen.dart';
import 'background.dart';
import './../../Signup/signup_screen.dart';
import './../../../components/already_have_an_account_acheck.dart';
import './../../../components/rounded_button.dart';
import './../../../components/rounded_input_field.dart';
import './../../../components/rounded_password_field.dart';
import './../../../net/flutterfire.dart';
import 'package:provider/provider.dart';
import 'package:lessmess/UI/Provider/number.dart';

import './../../Welcome/welcome_screen.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  String email;
  String pass;

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  @override
  //TextEditingController _emailField = RoundedInputField._emailField;
  //TextEditingController _emailField = TextEditingController();
  //TextEditingController _passwordField = TextEditingController();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (ctx) => Number(),)
    //   ],child: 
      Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/qr-code.svg",
              width: size.width * 0.30,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = '$value';
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                pass = '$value';
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                bool shouldNavigate =
                    await signIn(email, pass);

                if (shouldNavigate) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TabScreen(),
                    ),
                  );
                }else{
                  Fluttertoast.showToast(
                      msg: l.substring(36),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      fontSize: 16.0
                  );
                }

              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  //  );
  }
}
