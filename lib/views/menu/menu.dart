import 'package:documentauth/firebase_options.dart';
import 'package:documentauth/views/0_splash_screen/splash_screen.dart';
import 'package:documentauth/views/registerdata/registerdata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:documentauth/views/menu/menu.dart';
//Importar autentication_face_view
import 'package:documentauth/views/2_authenticate_face/authenticate_face_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SplashScreen());
}

class MenuMain extends StatelessWidget {
  const MenuMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authenticate Document'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Autenticarse
                // Cambiar a la vista de autenticación
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const AuthenticateFaceView()));
              },
              child: Text('Autenticarse'),
            ),
            ElevatedButton(
              onPressed: () {
                // Registrarse
                // Cambiar a la vista de registro
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const RegisterDataView()));
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
