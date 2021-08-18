import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/continue_with_phone.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Phone Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContinueWithPhone(),
    );
  }
}

