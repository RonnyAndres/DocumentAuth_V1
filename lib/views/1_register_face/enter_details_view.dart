// ignore_for_file: unused_field

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:documentauth/common/views/custom_button.dart';
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
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();

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
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                ),
              ),
              // Adiciona Cedula
              TextFormField(
                controller: _cedulaController,
                decoration: const InputDecoration(
                  labelText: "Cedula",
                  hintText: "Enter your Cedula",
                ),
              ),
              // Adiciona Correo
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(
                  labelText: "Correo",
                  hintText: "Enter your Correo",
                ),
              ),
              // Adiciona Telefono
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(
                  labelText: "Telefono",
                  hintText: "Enter your Telefono",
                ),
              ),
              // Adiciona Direccion
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(
                  labelText: "Direccion",
                  hintText: "Enter your Direccion",
                ),
              ),
              CustomButton(
                text: "Register",
                onTap: _registerUser,
              )
            ],
          ),
        ),
      ),
    );
  }

// Crea una funcion que vaide el registro de los datos

  void _registerUser() {
    if (_nameController.text.trim().isEmpty ||
        _cedulaController.text.trim().isEmpty ||
        _correoController.text.trim().isEmpty ||
        _telefonoController.text.trim().isEmpty ||
        _direccionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    // Validate email using regular expression
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    if (!emailRegex.hasMatch(_correoController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email format")),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    String userId = const Uuid().v1();
    UserModel user = UserModel(
      id: userId,
      name: _nameController.text.trim().toUpperCase(),
      cedula: _cedulaController.text.trim().toUpperCase(),
      correo: _correoController.text.trim().toUpperCase(),
      telefono: _telefonoController.text.trim().toUpperCase(),
      direccion: _direccionController.text.trim().toUpperCase(),
      image_face: widget.image,
      image_firma: widget.image,
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
