import 'package:flutter/material.dart';
import 'package:documentauth/views/signing/signing.dart';

class RegisterDataView extends StatelessWidget {
  const RegisterDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Datos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nombre Completo'),
            TextFormField(
                // Aquí puedes agregar la lógica para guardar el nombre completo
                ),
            SizedBox(height: 16.0),
            Text('Cédula'),
            TextFormField(
                // Aquí puedes agregar la lógica para guardar la cédula
                ),
            SizedBox(height: 16.0),
            Text('Email'),
            TextFormField(
                // Aquí puedes agregar la lógica para guardar el email
                ),
            SizedBox(height: 16.0),
            Text('Contraseña'),
            TextFormField(
                // Aquí puedes agregar la lógica para guardar la contraseña
                ),
            SizedBox(height: 16.0),
            Text('Confirmación Contraseña'),
            TextFormField(
                // Aquí puedes agregar la lógica para guardar la confirmación de contraseña
                ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para el botón "Siguiente"
                // Cambiar a la vista de firma
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => SigningView()));
              },
              child: Text('Siguiente'),
            ),
          ],
        ),
      ),
    );
  }
}
