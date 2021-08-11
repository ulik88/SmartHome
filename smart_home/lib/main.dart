import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/presentatoin/bloc/appliances_event.dart';
import 'package:smart_home/presentatoin/bloc/appliances_state.dart';
import 'package:smart_home/presentatoin/pages/home_page.dart';
import 'package:smart_home/presentatoin/widgets/action_buttons.dart';
import 'package:smart_home/services/authentication_service.dart';

import 'presentatoin/pages/sign_in_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ColorBloc>(
          create: (context) => ColorBloc(null),
          child: ActionButtons(),
        ),
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          backgroundColor: Colors.greenAccent[400],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenWrapper(),
      ),
    );
  }
}

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
