import 'package:flutter/material.dart';
import 'package:mide/misc/keyboard_keys.dart';

class FileTree extends StatelessWidget {
  const FileTree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            child: const Center(
              child: Text(
                'My Files',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const FlutterLogo(),
                  title: const Text('One-line with leading widget'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                ExpansionTile(
                                  leading: Icon(Icons.add),
                                  title: Text('New'),
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.description_outlined),
                                      title: Text('Blank file'),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.request_page_outlined),
                                      title: Text('Money file'),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.contact_page_outlined),
                                      title: Text('Human file'),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.create_new_folder_outlined),
                                      title: Text('Folder'),
                                    ),
                                  ],
                                ),
                                ListTile(
                                  leading: Icon(Icons.copy),
                                  title: Text('Copy File'),
                                  trailing: KeyboardKeys(
                                    shortcut: "Ctrl+C",
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.file_copy),
                                  title: Text('Duplicate File'),
                                  trailing: KeyboardKeys(
                                    shortcut: "Ctrl+D",
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.cut),
                                  title: Text('Cut File'),
                                  trailing: KeyboardKeys(
                                    shortcut: "Ctrl+X",
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.paste),
                                  title: Text('Paste'),
                                  trailing: KeyboardKeys(
                                    shortcut: "Ctrl+V",
                                  ),
                                ),
                                ExpansionTile(
                                  title: Text('Git'),
                                  children: [
                                    ListTile(
                                      title: Text('Add file'),
                                    ),
                                    ListTile(
                                      title: Text('Add file'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const ListTile(
                  title: Text('File 2'),
                ),
                ExpansionTile(
                  title: Text('Folder 1'),
                  children: [
                    ListTile(
                      title: Text('File 3'),
                      onTap: () {
                        showMenu(
                          context: context,
                          position:
                              const RelativeRect.fromLTRB(100, 100, 100, 100),
                          items: [
                            PopupMenuItem(
                              child: Text('Option 1'),
                            ),
                            PopupMenuItem(
                              child: Text('Option 2'),
                            ),
                            PopupMenuItem(
                              child: Text('Option 3'),
                            ),
                          ],
                        );
                      },
                    ),
                    ListTile(
                      title: Text('File 4'),
                      onTap: () {
                        // Add your own code here
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('Folder 2'),
                  children: [
                    ListTile(
                      title: Text('File 5'),
                      onTap: () {
                        // Add your own code here
                      },
                    ),
                    ListTile(
                      title: Text('File 6'),
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
}
