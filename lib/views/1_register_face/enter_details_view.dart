import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:documentauth/model/user_model.dart';
// Importar menu
import 'package:documentauth/views/menu/menu.dart';

class EnterDetailsView extends StatefulWidget {
  final String image;
  final FaceFeatures faceFeatures;

  const EnterDetailsView({
    Key? key,
    required this.image,
    required this.faceFeatures,
  }) : super(key: key);

  @override
  State<EnterDetailsView> createState() => _EnterDetailsViewState();
}

class _EnterDetailsViewState extends State<EnterDetailsView> {
  final _formFieldKey = GlobalKey<FormFieldState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Details"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                ),
              ),
              ElevatedButton(
                onPressed: _registerUser,
                child: const Text("Register Now"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registerUser() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Name cannot be empty")),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    String userId = Uuid().v1();
    UserModel user = UserModel(
      id: userId,
      name: _nameController.text.trim().toUpperCase(),
      image: widget.image,
      registeredOn: DateTime.now().millisecondsSinceEpoch,
      faceFeatures: widget.faceFeatures,
    );

    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(user.toJson())
        .catchError((e) {
      log("Registration Error: $e");
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Failed! Try Again.")),
      );
    }).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Success!")),
      );

      // Cam

      Future.delayed(const Duration(seconds: 1), () {
        // Navigate back
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MenuMain(),
          ),
        );
      });
    });
  }
}
