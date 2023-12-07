import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
