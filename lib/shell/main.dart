import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class CommandExecutor {
  final StreamController<String> _outputController = StreamController<String>();

  Stream<String> get outputStream => _outputController.stream;

  Future<void> execute(String command, List<String> args) async {
    Process process = await Process.start(command, args).catchError((error) {
      _outputController.add(error.toString());
    });

    process.stdout.transform(utf8.decoder).listen((line) {
      _outputController.add('line');
    });

    process.stderr.transform(utf8.decoder).listen((line) {
      _outputController.add(line);
    });

    await process.exitCode;
  }
}

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  _ShellScreenState createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  final CommandExecutor commandExecutor = CommandExecutor();
  final _commandController = TextEditingController();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();

  final List<String> output = [];

  void _executeCommand() {
    String command = _commandController.text.split(' ').first;
    List<String> args = _commandController.text.split(' ').skip(1).toList();
    commandExecutor.execute(command, args);
    _commandController.clear();
    _focusNode.requestFocus();

    if (_scrollController.hasClients) {
      final position = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 300),
        curve: decelerateEasing,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StreamBuilder<String>(
          stream: commandExecutor.outputStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              output.add('Error: ${snapshot.error}');
            }
            if (snapshot.hasData) {
              output.add('${snapshot.data}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              output.add('waiting...');
            }
            return Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: output.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(output[index]),
                  );
                },
              ),
            );
          },
        ),
        TextField(
          controller: _commandController,
          focusNode: _focusNode,
          onSubmitted: (value) {
            _executeCommand();
          },
        ),
        TextButton(
          onPressed: () {
            _executeCommand();
          },
          child: const Text('Run Command'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _commandController.dispose();
    super.dispose();
  }
}
