import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/services/authentication_service.dart';
import 'package:smart_home/theme/app_colors.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(26),
        color: Color(0x6541744F),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, top: 230, right: 20.0, bottom: 20.0),
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
              controller: emailController,
              decoration: InputDecoration(
                fillColor: Colors.white60,
                filled: true,
                prefixIcon: Icon(Icons.email),
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Enter your email here...",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  borderSide: BorderSide(color: Color(0x65D9D094), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Color(0x65D9D094), width: 2),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              width: 100,
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
              controller: passwordController,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                fillColor: Colors.white60,
                filled: true,
                prefixIcon: Icon(Icons.password),
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Enter your password here...",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  borderSide: BorderSide(color: Color(0x65D9D094), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Color(0x65D9D094), width: 2),
                ),
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              height: 10,
              width: 100,
            ),
            ElevatedButton(
              child:
                  Text("Sign in".toUpperCase(), style: TextStyle(fontSize: 14)),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.red)))),
              onPressed: () {
                context.read<AuthService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("Forgot Password? 'or' Ceate a new Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16,color: AppColors.splashColor)
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text("To be able to use the functions of the app, register or log in to the app!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16,color: Colors.black54)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
