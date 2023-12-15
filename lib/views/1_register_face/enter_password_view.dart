// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:documentauth/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:documentauth/views/1_register_face/register_face_view.dart';
import 'package:documentauth/model/password_model.dart';

class EnterPasswordView extends StatelessWidget {
  EnterPasswordView({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final _formFieldKey = GlobalKey<FormFieldState>();

  // Initialize Firebase
  void initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeFirebase(); // Call the initializeFirebase method

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Password"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                ),
                obscureText: true,
              ),
              ElevatedButton(
                child: Text("Continue"),
                onPressed: () async {
                  //FocusScope.of(context).unfocus();
                  FirebaseFirestore.instance
                      .collection("password")
                      .doc("S1LqmJr5CnU3I9ytW0pg")
                      .get()
                      .then((snap) {
                    Password password = Password.fromJson(snap.data()!);
                    if (password.password == _controller.text.trim()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterFaceView(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Wrong Password :(")),
                      );
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
