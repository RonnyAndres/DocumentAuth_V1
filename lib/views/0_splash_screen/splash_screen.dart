import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//Import menu page /views/menu.dart
import 'package:documentauth/views/menu/menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const MenuMain()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 236, 193, 174), Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.topRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo.png",
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Lottie.network(
                  "https://lottie.host/6ee5f733-df3d-4fba-b4cd-4832bc6f0cb2/pd0Q9IAwaI.json",
                  height: 200)
            ],
          ),
        ),
      ),
    );
  }
}
