import 'package:flutter/material.dart';
import 'package:mide/misc/filetree_drawer.dart';
import 'package:mide/misc/my_box.dart';
import 'package:mide/misc/my_tile.dart';
import 'package:mide/shell/terminal_view.dart';

class HorizontalBodyScaffold extends StatefulWidget {
  const HorizontalBodyScaffold({Key? key, required String savedText})
      : super(key: key);

  @override
  State<HorizontalBodyScaffold> createState() => _HorizontalBodyScaffoldState();
}

class _HorizontalBodyScaffoldState extends State<HorizontalBodyScaffold> {
  late final String savedText = "horizontal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // open drawer
          FileTree(path: savedText, width: 250.0),

          // first half of page
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.redAccent[100],
                    ),
                  ),
                ),
                const Expanded(
                  child: ShellScreen(),
                ),
              ],
            ),
          ),
          // second half of page
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.amber[100],
                    ),
                  ),
                ),
                // list of stuff
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blueGrey[200],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
