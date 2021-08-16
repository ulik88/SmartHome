import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_home/presentatoin/pages/home_page.dart';
import 'package:smart_home/presentatoin/pages/sign_in_page.dart';

class AuthenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      print(firebaseUser.email);

      return HomePage();
    }
    return SignInPage();
  }
}
