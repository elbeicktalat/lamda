import 'dart:io';

import 'package:lamda/src/colors.dart';
import 'package:lamda/src/command.dart';
import 'package:lamda/src/progress_successful.dart';

class Copy implements Command {
  @override
  String get command => 'copy';

  @override
  String get description =>
      "Copy files between directories example: copy <file name> <directory name> and you'll done.";

  Future<void> copy(List<String> args) async {
    String firstArg;
    firstArg = args.first.toLowerCase();
    if (firstArg == command) {
      final file = File(args[1]);
      await file.copy(args[2]).then(
            (value) => print(
              ProgressSuccessful(
                'copy <${Colors.blue(args[1])}> into <${Colors.green(args[2])}>',
              ),
            ),
          );
    }
  }
}
