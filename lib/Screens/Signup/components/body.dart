import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lessmess/enums/mess.dart';

import '../../../components/rounded_input_field.dart';
import './../../../Screens/Login/login_screen.dart';
import 'background.dart';
import 'or_divider.dart';
import 'social_icon.dart';
import './../../../components/already_have_an_account_acheck.dart';
import './../../../components/rounded_button.dart';
import './../../../components/rounded_input_field.dart';
import './../../../components/rounded_password_field.dart';
import './../../../net/flutterfire.dart';

import './../../Login/login_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  TextEditingController _emailField = TextEditingController();

  TextEditingController _passwordField = TextEditingController();

  String email;

  String pass;

  String regno;

  String name;
  List<bool> isSelected = [false, false, false];
  List<String> messoptions = ['FC1', 'FC2', 'Apoorva'];

  Future<void> initiateSignup(String messer) async {
    print(email);
    print(regno);
    print(name);
    print(messer);
    bool shouldNavigate = await register(email, pass, name, messer, regno);

    if (shouldNavigate) {
      Fluttertoast.showToast(
          msg: "Registration Successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: l.substring(36),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),

            RoundedInputField(
              //controller: _emailField;
              hintText: "Name",
              onChanged: (value) {
                name = '$value';
              },
            ),
            RoundedInputField(
              //controller: _emailField;
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
            RoundedInputField(
              //controller: _emailField;
              hintText: "RegNo",
              onChanged: (value) {
                regno = '$value';
              },
            ),
            SizedBox(height: size.height * 0.03),
            MessSelector(
              initiateSignup: initiateSignup,
              isSelected: isSelected,
              messOptions: messoptions,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MessSelector extends StatefulWidget {
  final List<bool> isSelected;
  final List<String> messOptions;
  final Function initiateSignup;
  MessSelector({this.isSelected, this.messOptions, this.initiateSignup});
  @override
  _MessSelectorState createState() => _MessSelectorState();
}

class _MessSelectorState extends State<MessSelector> {
  String messi;
  @override
  Widget build(BuildContext context) {
    
    print(messi);
    return Column(
      children: [
        ToggleButtons(
          children: <Widget>[Text('FC1'), Text('FC2'), Text('Apoorva')],
          isSelected: widget.isSelected,
          onPressed: (int index) {
            setState(() {
              // for (int indexBtn = 0;
              //     indexBtn < widget.isSelected.length;
              //     indexBtn++) {
              //   if (indexBtn == index) {
              //     widget.isSelected[indexBtn] = true;
              //     // mess = widget.messOptions.elementAt(index);
              //     print(index);
              //     print(widget.isSelected);

              //     switch (index) {
              //       case 0:
              //         mess = Mess.FC1;
              //         break;
              //       case 1:
              //         mess = Mess.FC2;
              //         break;
              //       case 2:
              //         mess = Mess.Apoorva;
              //         break;
              //     }
              //   } else {
              //     widget.isSelected[indexBtn] = false;
              //   }
              // }
              for (int indexBtn = 0;
                  indexBtn < widget.isSelected.length;
                  indexBtn++) {
                if (indexBtn == index) {
                  widget.isSelected[indexBtn] = true;
                  print(widget.messOptions.elementAt(index));
                  setState(() {
                    messi = widget.messOptions.elementAt(index);
                  });

                  print(messi + '--------------------------------');
                  print(widget.isSelected);
                } else {
                  widget.isSelected[indexBtn] = false;
                }
              }
              for (int indexBtn = widget.isSelected.length - 1;
                  indexBtn >= 0;
                  indexBtn--) {
                if (indexBtn == index) {
                  widget.isSelected[indexBtn] = true;
                  print(widget.messOptions.elementAt(index));
                  setState(() {
                    messi = widget.messOptions.elementAt(index);
                  });

                  print(widget.isSelected);
                } else {
                  widget.isSelected[indexBtn] = false;
                }
              }
            });
          },
        ),
        RoundedButton(
          text: "SIGNUP",
          press: () {
            print(messi);
            widget.initiateSignup(messi);
          },
        ),
      ],
    );
  }
}
