import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final text;
  final onPressed;
  final color;

  CustomButton({required this.text, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width / 1.25,
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
