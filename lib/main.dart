// ignore_for_file: unused_import, duplicate_import

import 'package:documentauth/common/utils/custom_snackbar.dart';
import 'package:documentauth/common/utils/screen_size_util.dart';
import 'package:documentauth/views/0_splash_screen/splash_screen.dart';
import 'package:documentauth/views/1_register_face/enter_password_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
