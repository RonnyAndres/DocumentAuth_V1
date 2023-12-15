import 'package:documentauth/common/utils/custom_snackbar.dart';
import 'package:documentauth/common/utils/screen_size_util.dart';
import 'package:documentauth/firebase_options.dart';
import 'package:documentauth/views/0_splash_screen/splash_screen.dart';
import 'package:documentauth/views/signing/signing.dart';
//import 'package:documentauth/views/registerdata/registerdata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:documentauth/views/menu/menu.dart';
//Importar autentication_face_view
import 'package:documentauth/views/2_authenticate_face/authenticate_face_view.dart';
//Import Custom Button
import 'package:documentauth/common/views/custom_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SplashScreen());
}

void initializeUtilContexts(BuildContext context) {
  ScreenSizeUtil.context = context;
  CustomSnackBar.context = context;
}

class MenuMain extends StatelessWidget {
  const MenuMain({super.key});
  @override
  Widget build(BuildContext context) {
    initializeUtilContexts(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authenticate Document'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Authenticarse',
              onTap: () {
                // Registrarse
                // Cambiar a la vista de registro
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AuthenticateFaceView(),
                  ),
                );
              },
            ),
            CustomButton(
              text: 'Registrarse',
              onTap: () {
                // Registrarse
                // Cambiar a la vista de registro
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignatureScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
