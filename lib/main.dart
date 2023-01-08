import 'package:flutter/material.dart';
import 'package:mide/filetree.dart';
import 'package:mide/shell/main.dart';
import 'package:mide/views/main_options.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: mIDE(),
  ));
}

class mIDE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return const ShellScreen();
      },
    );
  }
}
