import 'package:all_mu/screen/collage_selecting_screen.dart';
import 'package:all_mu/screen/home_Screen.dart';

import 'package:all_mu/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return const CollageSelectingScreen();
        } else {
          return const AuthSplashScreen();
        }
      }),
    ),
  ));
}
