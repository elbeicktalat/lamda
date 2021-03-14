import 'dart:io';
import 'package:lamda/src/colors.dart';
import 'package:lamda/src/command.dart';
import 'package:lamda/src/progress_successful.dart';

class Delete extends Command {
  @override
  String get command => 'delete'.toLowerCase();

  @override
  String get description =>
      'delete files and directories example: delete <fileName>';

  Future<void> delete(List<String> args) async {
    commandArg = args.first.toLowerCase();
    if (commandArg == command) {
      for (index = 1; index < args.length; index++) {
        final file = File(args[index]);
        await file.delete(recursive: true).then(
            (_) => print(
                  ProgressSuccessful(
                    'delete<${Colors.red(args[index])}>',
                  ),
                ),
            onError: (error) => print(error));
      }
    }
  }
}
