import 'dart:io';

import 'package:lamda/src/command.dart';

class ReName implements Command {
  @override
  String get command => 'rename';

  @override
  String get description =>
      'Rename files or directories example: rename file <oldName> <newName>.';

  Future<void> rename(List<String> args) async {
    int index;
    String firstArg;
    String secondArg;
    firstArg = args.first.toLowerCase();
    secondArg = args[1].toLowerCase();
    if (firstArg == command) {
      for (index = 2; index < args.length; index += 2) {
        if (secondArg == 'file') {
          final file = File(args[index]);
          await file.rename(args[index + 1]).then((value) => print(
              'rename file\x1B[31m <${args[index]}>\x1B[0m to \x1B[32m<${args[index + 1]}>\x1B[0m is successfully!'));
        }
        if (secondArg == 'dir') {
          final directory = Directory(args[index]);
          await directory.rename(args[index + 1]).then((value) => print(
              'rename directory\x1B[31m <${args[index]}>\x1B[0m to \x1B[32m<${args[index + 1]}>\x1B[0m is successfully!'));
        }
      }
    }
  }
}
