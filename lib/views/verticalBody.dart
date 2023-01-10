import 'package:flutter/material.dart';
import 'package:mide/misc/filetree_drawer.dart';
import 'package:mide/misc/my_box.dart';
import 'package:mide/misc/my_tile.dart';
import 'package:mide/shell/terminal_view.dart';

class VerticalBodyScaffold extends StatefulWidget {
  const VerticalBodyScaffold({Key? key, required String savedText})
      : super(key: key);

  @override
  State<VerticalBodyScaffold> createState() => _VerticalBodyScaffoldState();
}

class _VerticalBodyScaffoldState extends State<VerticalBodyScaffold> {
  late final String savedText = "vertical";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: FileTree(
        path: savedText,
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ShellScreen(),
      ),
    );
  }
}
