import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 20.0, top: 20.0, right: 20.0, bottom: 50.0),
          ),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintStyle: TextStyle(color: Colors.grey),
              labelText: "Enter your email here...",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
                borderSide: BorderSide(color: Colors.green, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.green, width: 0.5),
              ),
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
            controller: passwordController,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.password),
              hintStyle: TextStyle(color: Colors.grey),
              labelText: "Enter your password here...",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
                borderSide: BorderSide(color: Colors.green, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.green, width: 0.5),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              context.read<AuthService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
            },
            child: Text("Sign in"),
          )
        ],
      ),
    );
  }
}
