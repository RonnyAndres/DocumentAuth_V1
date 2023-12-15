import 'dart:convert';
import 'dart:typed_data';
import 'package:documentauth/views/1_register_face/enter_password_view.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({Key? key}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  SignatureController signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Signature'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Signature(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                controller: signatureController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                padButtonOption(Colors.redAccent, 'Clear', () {
                  signatureController.clear();
                }),
                padButtonOption(
                    const Color.fromARGB(255, 105, 152, 240), 'Done', () async {
                  if (signatureController.isNotEmpty) {
                    final signature = await exportSignature();
                    if (signature.isNotEmpty) {
                      // Cambiar a la vista de enter_password
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EnterPasswordView(),
                        ),
                      );
                    }
                  }
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> exportSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
      points: signatureController.points,
    );

    final signature = await exportController.toPngBytes();
    exportController.dispose();
    return signature!;
  }

  ElevatedButton padButtonOption(
      Color btnClr, String btnTxt, Function() btnOnTapAction) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(btnClr),
            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            textStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)))),
        onPressed: btnOnTapAction,
        child: Text(btnTxt));
  }
}
