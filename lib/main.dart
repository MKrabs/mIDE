import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mide/misc/filetree_drawer.dart';
import 'package:mide/views/main_options.dart';
import 'package:mide/views/project_view.dart';
import 'package:mide/views/verticalBody.dart';
import 'package:mide/views/horizontalBody.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: mIDE(),
  ));
}

class mIDE extends StatefulWidget {
  @override
  State<mIDE> createState() => _mIDEState();
}

class _mIDEState extends State<mIDE> {
  final String _savedText = "testsave";

  @override
  void initState() {
    super.initState();
    // Load saved text from SharedPreferences
    _loadSavedText();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    if (_savedText != null) {
      // If saved text found, go straight to the ProjectView
      return SafeArea(
        child: Scaffold(
          body: ProjectView(
            verticalBody: VerticalBodyScaffold(savedText: _savedText),
            horizontalBody: HorizontalBodyScaffold(savedText: _savedText),
          ),
          drawerEdgeDragWidth: MediaQuery.of(context).size.width,
        ),
      );
    } else {
      // If no saved text, show the WelcomeScreen
      return const MainOptions();
    }
  }

  Future<void> _loadSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // _savedText = prefs.getString('savedText')!;
    });
  }
}
