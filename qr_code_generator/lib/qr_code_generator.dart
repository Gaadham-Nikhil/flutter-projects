import 'package:flutter/material.dart';

class QrCodeGenerator extends StatefulWidget {
  const QrCodeGenerator({super.key});

  @override
  State<QrCodeGenerator> createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "QR Code Generator",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 93, 198, 246),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 8.0
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 105, 180, 245),
            ),
            onPressed: (){},
            child: const Text(
              "Generate",
              style: TextStyle(
                color: Colors.black
              )
            ),
          ),
        ],
      ),
    );
  }
}