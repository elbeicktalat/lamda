import 'dart:io';
import 'package:lamda/src/colors.dart';
import 'package:lamda/src/command.dart';
import 'package:lamda/src/progress_successful.dart';

class Make extends Command {
  @override
  String get command => 'make'.toLowerCase();

  @override
  String get description =>
      "Type 'make file <name>' or 'make dir <name>' to create files & directories.";

  Future<void> make(List<String> args) async {
    commandArg = args.first.toLowerCase();
    optionArg = args[1].toLowerCase();

    if (commandArg == command) {
      for (index = 2; index < args.length; index++) {
        if (optionArg == 'file') {
          final file = File(args[index]);
          await file.create().then(
                (value) => print(
                  ProgressSuccessful(
                    'create file <${Colors.green(args[index])}>',
                  ),
                ),
              );
        }
        if (optionArg == 'dir') {
          final file = Directory(args[index]);
          await file.create().then(
                (value) => print(
                  ProgressSuccessful(
                    'create directory <${Colors.green(args[index])}>',
                  ),
                ),
              );
        }
      }
    }
  }
}
