import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String txt;
  final Function callback;

  Button(this.txt, this.callback);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => callback(txt),
      style: TextButton.styleFrom(
        fixedSize: const Size(70, 70),
        backgroundColor: Colors.grey[700],
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
      ),
      child: Text(txt),
    );
  }
}
