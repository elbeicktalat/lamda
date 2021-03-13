import 'dart:io';

import 'package:lamda/src/colors.dart';
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
    int index;
    firstArg = args.first.toLowerCase();
    if (firstArg == command) {
      for (index = 1; index < args.length - 1; index++) {
        final file = File(args[index]);
        await file.copy(args.last + '/' + args[index]);
        await file.delete().then(
              (value) => print(
                ProgressSuccessful(
                  'cut <${Colors.red(args[index])}> into <${Colors.green(args.last)}>',
                ),
              ),
            );
      }
    }
  }
}
