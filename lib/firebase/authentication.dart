import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialctr/provider/Provider.dart';
import 'package:socialctr/utils/flutter_toast.dart';
import 'package:socialctr/view/HomePage.dart';
import 'package:socialctr/view/loginScreen.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//-------------------------------------------------------------------------------------------//
  signUp(String email, String password, BuildContext context) {
    LoadingProvider loadingProvider =
        Provider.of<LoadingProvider>(context, listen: false);
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      loadingProvider.setLoading(false);
      Utils().toastMessage("User Created Succesfully :- ${value.toString()}");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((context) {
        return const HomePage();
      })));
    }).onError((error, stackTrace) {
      loadingProvider.setLoading(false);
      Utils().toastMessage("user not created :- ${error.toString()}");
    });
  }

//-------------------------------------------------------------------------------------------//
  login(String email, String password, BuildContext context) {
    LoadingProvider loadingProvider =
        Provider.of<LoadingProvider>(context, listen: false);

    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      loadingProvider.setLoading(false);
      Utils().toastMessage("Login Successfuly");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((context) {
        return const HomePage();
      })));
    }).onError((error, stackTrace) {
      loadingProvider.setLoading(false);
      Utils().toastMessage(error.toString());
    });
  }

//-------------------------------------------------------------------------------------------//
  logout(BuildContext context) {
    _auth.signOut().then((value) {
      Utils().toastMessage("Loged out");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((context) {
        return const LoginScreen();
      })));
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }
}
