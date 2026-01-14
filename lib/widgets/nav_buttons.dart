import 'package:flutter/material.dart';


class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;  const NavButton({super.key, required this.title,required this.ontap});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: ontap,
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}