import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lessmess/enums/mess.dart';
String l;

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    l = e.toString();
    print(e);
    return false;
  }
}

Future<bool> register(
    String email, String password, String name, String messer, String regNo) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseFirestore.instance.collection('users').doc(regNo).set({
      'email': email,
      'name': name,
      'mess': messer,
    });
    return true;
  } on FirebaseAuthException catch (e) {
    print(e.message);
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      l = e.toString();
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      l = e.toString();
    }
    return false;
  } catch (e) {
    print(e.toString());
    l = e.toString();
    return false;
  }
}
