import 'package:flutter/material.dart';

class KeyboardKeys extends StatelessWidget {
  final String shortcut;

  const KeyboardKeys({super.key,
    required this.shortcut,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      elevation: 1.4,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
            shortcut,
        style: TextStyle(
          color: Colors.grey[600],
        ),),
      ),
    );
  }
}
