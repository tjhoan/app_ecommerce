import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const InputField({super.key, 
    required this.hintText,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
