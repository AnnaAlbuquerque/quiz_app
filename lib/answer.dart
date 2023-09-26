import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const Answer({
    required this.text,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
