import 'dart:io';

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
      final path = Directory.current.uri.toString().substring(8);
      await file.copy('${path + args[2] + '/' + args[1]}').then(
            (value) => print(
              ProgressSuccessful(
                'copy \x1B[34m<${args[1]}>\x1B[0m into \x1B[32m<${args[2]}>\x1B[0m',
              ),
            ),
          );
    }
  }
}
