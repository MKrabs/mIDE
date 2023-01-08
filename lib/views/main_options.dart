import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mide/shell/main.dart';

class MainOptions extends StatelessWidget {
  const MainOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 8.0, top: 200),
                width: 100.0,
                height: 100.0,
                color: Colors.grey[300],
                child: TextButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.create_new_folder_outlined),
                      Text(
                        "New Project",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                width: 100.0,
                height: 100.0,
                color: Colors.grey[300],
                child: TextButton(
                  onPressed: () async {
                    String? result =
                        await FilePicker.platform.getDirectoryPath();

                    if (result != null) {
                      print("=====================");
                      print(result);
                      print("=====================");
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.folder_open),
                      Text(
                        "Open",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 100.0, top: 8.0),
                width: 100.0,
                height: 100.0,
                color: Colors.grey[300],
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: const Text('Clone Project from git source'),
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: 'Url',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                child: const Text('Submit'),
                                onPressed: () async {
                                  String? result = await FilePicker.platform
                                      .getDirectoryPath();

                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(Icons.merge),
                      Text(
                        "Get from VCS",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Recent Projects",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.workspaces),
                      label: const Text("Project 1"),
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  Object project = {
    'Name': 'undefined',
    'Path': nullptr,
    'origin': nullptr,
  };

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              hint: const Text("Version Control"),
              value: selectedValue,
              items: const [
                DropdownMenuItem(
                  value: 'git',
                  child: Text('Git'),
                ),
                DropdownMenuItem(
                  value: 'svn',
                  enabled: false,
                  child: Text(
                    'Subversion',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Url:'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Submit the form.
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
