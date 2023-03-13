import 'package:all_mu/screen/collage_selecting_screen.dart';
import 'package:all_mu/screen/image_slider.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CollageSelectingScreen(),
  ));
}
