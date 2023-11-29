import 'dart:convert';

import 'package:documentauth/common/utils/extract_face_feature.dart';
import 'package:documentauth/common/views/camera_view.dart';
import 'package:documentauth/model/user_model.dart';
import 'package:documentauth/views/1_register_face/enter_details_view.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class RegisterFaceView extends StatefulWidget {
  const RegisterFaceView({Key? key}) : super(key: key);

  @override
  State<RegisterFaceView> createState() => _RegisterFaceViewState();
}

class _RegisterFaceViewState extends State<RegisterFaceView> {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableLandmarks: true,
      performanceMode: FaceDetectorMode.accurate,
    ),
  );
  String? _image;
  FaceFeatures? _faceFeatures;

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register User"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: CameraView(
              onImage: (image) {
                setState(() {
                  _image = base64Encode(image);
                });
              },
              onInputImage: (inputImage) async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                _faceFeatures =
                    await extractFaceFeatures(inputImage, _faceDetector);
                setState(() {});
                if (mounted) Navigator.of(context).pop();
              },
            ),
          ),
          if (_image != null)
            ElevatedButton(
              child: const Text("Start Registering"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EnterDetailsView(
                      image: _image!,
                      faceFeatures: _faceFeatures!,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
