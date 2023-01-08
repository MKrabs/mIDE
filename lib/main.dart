import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mide/filetree.dart';
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
    SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: []);
    return Builder(
      builder: (context) {
        return Scaffold(
          body: MainOptions(),
          drawer: FileTree(),
          drawerEdgeDragWidth: MediaQuery.of(context).size.width,
        );
      },
    );
  }
}
