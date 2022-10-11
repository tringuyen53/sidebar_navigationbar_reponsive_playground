import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Account',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
