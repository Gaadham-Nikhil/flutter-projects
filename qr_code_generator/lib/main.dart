import 'package:flutter/material.dart';
import 'package:qr_code_generator/qr_code_generator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 251, 195, 28),
        primarySwatch: Colors.lime 
      ),
      home: const QrCodeGenerator(),
    );
  }
}
