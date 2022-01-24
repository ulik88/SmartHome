import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/services/authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(26),
        color: Color(0x65D9D094),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, top: 190, right: 20.0, bottom: 20.0),
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
              controller: emailController,
              decoration: InputDecoration(
                  fillColor: Colors.white60, filled: true,
                prefixIcon: Icon(Icons.email),
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Enter your email here...",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
                fillColor: Colors.white60, filled: true,
                prefixIcon: Icon(Icons.password),
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Enter your password here...",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
              ),
            ),
            SizedBox(width: 10),

            SizedBox(
              height: 20,
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
          ],
        ),
      ),
    );
  }
}
