import 'dart:io';
import 'package:lamda/src/command.dart';

class Make implements Command {
  @override
  String get description =>
      "Type 'make file <name>' or 'make dir <name>' to create files & directories.";

  @override
  String get command => 'make'.toLowerCase();

  Future<void> make(List<String> args) async {
    int index;
    String firstArg;
    String secondArg;
    firstArg = args.first.toLowerCase();
    secondArg = args[1].toLowerCase();

    if (firstArg == command) {
      for (index = 2; index < args.length; index++) {
        if (secondArg == 'file') {
          final file = File(args[index]);
          await file.create().then((value) => print(
              'create file\x1B[32m <${args[index]}>\x1B[0m is successfully!'));
        }
        if (secondArg == 'dir') {
          final file = Directory(args[index]);
          await file.create().then((value) => print(
              'create directory\x1B[32m <${args[index]}>\x1B[0m is successfully!'));
        }
      }
    }
  }
}
