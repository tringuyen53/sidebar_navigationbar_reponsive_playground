import 'package:flutter/material.dart';

class CameraViewScreen extends StatelessWidget {
  const CameraViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Cameras',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
