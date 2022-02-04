import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/presentatoin/pages/home_page.dart';
import 'package:smart_home/presentatoin/pages/sign_in_page.dart';
import 'package:smart_home/services/auth_warpper.dart';
import 'package:smart_home/services/authentication_service.dart';
import 'package:smart_home/theme/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
      create: (_) => AuthService(FirebaseAuth.instance),
      child: StreamProvider(
        create: (context) => context.read<AuthService>().authState,
        initialData: null,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.mainDarkBlue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: AnimatedSplashScreen(
            backgroundColor: AppColors.splashColor,
            splashIconSize: 250,
            splash: Icons.home,
            duration: 2000,
            nextScreen: AuthenWrapper(),
          ),
          routes: {
            '/pages/sign_in_page': (context) => SignInPage(),
            '/pages/home_page': (context) => HomePage(),
          },
          initialRoute: '/',
          //----> AuthenWrapper(),
        ),
      ),
    );
  }
}
