import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  CommandExecutor.execute('echo', ['Hello', 'world!']).then((output) {
    print(output);
  }).onError((error, stackTrace) {
    print(error);
  });
}

class CommandExecutor {
  static Future<Stream<String>> execute(String command, List<String> args) async {
    Process process = await Process.start(command, args);

    // Create a stream that emits the output of the process line by line.
    Stream<String> output = process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter());

    // Wait for the process to exit and return the output stream.
    return process.exitCode.then((_) => output);
  }
}
class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  _ShellScreenState createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  final _commandController = TextEditingController();
  Stream<String> _outputStream = Stream.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _commandController,
          ),
          TextButton(
            onPressed: () async {
              String command = _commandController.text.split(' ').first;
              List<String> args =
                  _commandController.text.split(' ').skip(1).toList();

              print("====================\n"
                  "command: $command\n"
                  "args: $args\n"
                  "====================");
              _outputStream = await CommandExecutor.execute(command, args);
            },
            child: Text('Run'),
          ),
          Expanded(
            child: StreamBuilder<String>(
              stream: _outputStream.asBroadcastStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  return Text('${snapshot.data}');
                }
                return Text('Loading...');
              },
            )
            ,
          ),
        ],
      ),
    );
  }
}
