import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mide/misc/keyboard_keys.dart';

class FileTree extends StatefulWidget {
  final double width;
  final String path;

  const FileTree({super.key, this.width = 304, required this.path});

  @override
  State<FileTree> createState() => _FileTreeState();
}

class _FileTreeState extends State<FileTree> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: widget.width,
      backgroundColor: Colors.grey.shade200,
      child: Column(
        children: [
          ListTile(
            leading: const FlutterLogo(),
            title: Text(
              widget.path,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {},
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text(
                    'File 2 but very very very very very very very very very very very very very very very very very very very very very very very very long',
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                  onLongPress: () {
                    buildShowDialog(context,
                        'File 2 but very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very long');
                  },
                ),
                ExpansionTile(
                  title: const Text('Folder 1'),
                  children: [
                    ListTile(
                      title: const Text('File 3'),
                      onLongPress: () {
                        buildShowDialog(context, 'File 3');
                      },
                    ),
                    ListTile(
                      title: const Text('File 4'),
                      onLongPress: () {
                        buildShowDialog(context, 'File 4');
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Folder 2'),
                  children: [
                    ListTile(
                      title: const Text('File 5'),
                      onLongPress: () {
                        buildShowDialog(context, 'File 5');
                      },
                    ),
                    ListTile(
                      title: const Text('File 6'),
                      onTap: () {
                        // Add your own code here
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context, String filepath) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ExpansionTile(
                  leading: const Icon(Icons.add),
                  title: const Text('New...'),
                  children: [
                    const ListTile(
                      leading: Icon(Icons.description_outlined),
                      title: Text(
                        'Blank',
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.request_page_outlined),
                      title: Text(
                        'Money',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.contact_page_outlined),
                      title: Text(
                        'Human',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ListTile(
                        leading: const Icon(Icons.create_new_folder_outlined),
                        title: const Text('folder'),
                        subtitle: Text(
                          filepath,
                          maxLines: 1,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ],
                ),
                ExpansionTile(
                  leading: const Icon(
                    Icons.playlist_play,
                  ),
                  title: const Text('Run...'),
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.play_arrow, color: Colors.green),
                      title: const Text('Run'),
                      subtitle: Text(
                        filepath,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      trailing: const KeyboardKeys(shortcut: "Shift+F10"),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.bug_report,
                        color: Colors.green,
                      ),
                      title: const Text('Debug'),
                      subtitle: Text(
                        filepath,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.copy),
                  title: const Text('Copy'),
                  subtitle: Text(
                    filepath,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  trailing: const KeyboardKeys(
                    shortcut: "Ctrl+C",
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.file_copy),
                  title: const Text('Duplicate'),
                  subtitle: Text(
                    filepath,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  trailing: const KeyboardKeys(
                    shortcut: "Ctrl+D",
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.cut),
                  title: const Text('Cut'),
                  subtitle: Text(
                    filepath,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  trailing: const KeyboardKeys(
                    shortcut: "Ctrl+X",
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.paste),
                  title: Text('Paste'),
                  trailing: KeyboardKeys(
                    shortcut: "Ctrl+V",
                  ),
                ),
                ExpansionTile(
                  leading: const Icon(Icons.call_split),
                  title: const Text('Git'),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Add'),
                      subtitle: Text(
                        filepath,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.compare_arrows),
                      title: Text('Show diff'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.u_turn_left),
                      title: Text('Rollback'),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.south_west,
                        color: Colors.lightBlue,
                      ),
                      title: Text('Update Project'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.check,
                        color: Colors.lightGreen,
                      ),
                      title: const Text('Commit'),
                      subtitle: Text(
                        filepath,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      trailing: const KeyboardKeys(shortcut: "Ctrl+K"),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.north_east,
                        color: Colors.lightGreen,
                      ),
                      title: Text('Push commits'),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.timeline,
                      ),
                      title: Text('History'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
