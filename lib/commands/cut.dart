import 'dart:io';

import 'package:lamda/src/command.dart';
import 'package:lamda/src/progress_successful.dart';

class Cut implements Command {
  @override
  String get command => 'cut';

  @override
  String get description =>
      'Cut files into directories example: cut <file name> <directory name>.';

  Future<void> cut(List<String> args) async {
    String firstArg;
    firstArg = args.first.toLowerCase();
    if (firstArg == command) {
      final file = File(args[1]);
      await file.copy(args[2]);
      await file.delete().then(
            (value) => print(
              ProgressSuccessful(
                'cut \x1B[31m<${args[1]}>\x1B[0m into \x1B[32m<${args[2]}>\x1B[0m',
              ),
            ),
          );
    }
  }
}
