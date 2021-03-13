import 'dart:io';

import 'package:lamda/src/colors.dart';
import 'package:lamda/src/command.dart';
import 'package:lamda/src/progress_successful.dart';

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
          await file.rename(args[index + 1]).then(
                (value) => print(
                  ProgressSuccessful(
                    'rename file <${Colors.red(args[index])}> to <${Colors.green(args[index + 1])}>',
                  ),
                ),
              );
        }
        if (secondArg == 'dir') {
          final directory = Directory(args[index]);
          await directory.rename(args[index + 1]).then(
                (value) => print(
                  ProgressSuccessful(
                    'rename directory <${Colors.red(args[index])}> to <${Colors.green(args[index + 1])}>',
                  ),
                ),
              );
        }
      }
    }
  }
}
