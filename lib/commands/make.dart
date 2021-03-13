import 'dart:io';
import 'package:lamda/src/colors.dart';
import 'package:lamda/src/command.dart';
import 'package:lamda/src/progress_successful.dart';

class Make implements Command {
  @override
  String get description =>
      "Type 'make file <name>' or 'make dir <name>' to create files & directories.";

  @override
  String get command => 'make'.toLowerCase();

  Future<void> make(List<String> args) async {
    int index;
    String firstArg;
    String secondArg;
    firstArg = args.first.toLowerCase();
    secondArg = args[1].toLowerCase();

    if (firstArg == command) {
      for (index = 2; index < args.length; index++) {
        if (secondArg == 'file') {
          final file = File(args[index]);
          await file.create().then(
                (value) => print(
                  ProgressSuccessful(
                    'create file <${Colors.green(args[index])}>',
                  ),
                ),
              );
        }
        if (secondArg == 'dir') {
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
