import 'package:flutter/material.dart';
import 'package:documentauth/views/1_register_face/enter_password_view.dart';

class SigningView extends StatefulWidget {
  const SigningView({Key? key}) : super(key: key);
  @override
  _SigningViewState createState() => _SigningViewState();
}

class _SigningViewState extends State<SigningView> {
  // Variable para almacenar la firma
  String signature = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signing View'),
      ),
      body: Column(
        children: [
          // Sección para hacer la firma manual
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[200],
            child: Center(
              child: Text('Aquí se haría la firma manual'),
            ),
          ),
          SizedBox(height: 20),
          // Botones para resetear y avanzar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Lógica para resetear la firma
                  setState(() {
                    signature = '';
                  });
                },
                child: Text('Resetear'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => EnterPasswordView()));
                },
                child: Text('Siguiente'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
