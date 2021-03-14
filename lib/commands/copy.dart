import 'dart:io';

import 'package:lamda/src/colors.dart';
import 'package:lamda/src/command.dart';
import 'package:lamda/src/progress_successful.dart';

class Copy extends Command {
  @override
  String get command => 'copy';

  @override
  String get description =>
      "Copy files between directories example: copy <file name> <directory name> and you'll done.";

  Future<void> copy(List<String> args) async {
    commandArg = args.first.toLowerCase();
    if (commandArg == command) {
      for (index = 1; index < args.length - 1; index++) {
        final file = File(args[index]);
        await file.copy(args.last + '/' + args[index]).then(
              (value) => print(
                ProgressSuccessful(
                  'copy <${Colors.blue(args[index])}> into <${Colors.green(args.last)}>',
                ),
              ),
              onError: (error) => print(error),
            );
      }
    }
  }
}
