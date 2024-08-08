import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.label});

  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(label),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
