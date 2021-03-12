import 'dart:io';
import 'package:lamda/src/command.dart';
import 'package:lamda/src/progress_successful.dart';

class Delete implements Command {
  @override
  String get command => 'delete'.toLowerCase();

  @override
  String get description =>
      'delete files and directories example: delete <fileName>';

  Future<void> delete(List<String> args) async {
    int index;
    String firstArg;

    firstArg = args.first.toLowerCase();
    if (firstArg == command) {
      for (index = 1; index < args.length; index++) {
        final file = File(args[index]);
        await file.delete(recursive: true).then(
              (value) => print(
                ProgressSuccessful(
                  'delete\x1B[31m <${args[index]}>\x1B[0m',
                ),
              ),
            );
      }
    }
  }
}
