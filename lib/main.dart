import 'package:flutter/material.dart';
import 'package:mide/filetree.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mIDE(),
    )
  );
}

class mIDE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer menu')),
      body: const Center(
        child: Text('Click on the menu icon'),
      ),
      drawer: const FileTree(),
    );
  }
}

