import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double height;
  const BigButton({super.key, required this.onPressed, required this.text, required this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height)),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
