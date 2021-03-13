import 'dart:io';

import 'package:lamda/src/colors.dart';
import 'package:lamda/src/command.dart';
import 'package:lamda/src/progress_successful.dart';

class ReName extends Command {
  @override
  String get command => 'rename';

  @override
  String get description =>
      'Rename files or directories example: rename file <oldName> <newName>.';

  Future<void> rename(List<String> args) async {
    commandArg = args.first.toLowerCase();
    optionArg = args[1].toLowerCase();
    if (commandArg == command) {
      for (index = 2; index < args.length; index += 2) {
        if (optionArg == 'file') {
          final file = File(args[index]);
          await file.rename(args[index + 1]).then(
                (value) => print(
                  ProgressSuccessful(
                    'rename file <${Colors.red(args[index])}> to <${Colors.green(args[index + 1])}>',
                  ),
                ),
              );
        }
        if (optionArg == 'dir') {
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
