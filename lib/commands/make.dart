import 'dart:io';
import 'package:lamda/messages/already_exists.dart';
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
          await file.exists().then(
                (alreadyExists) => alreadyExists
                    ? print(AlreadyExists('<${args[index]}>'))
                    : file.create().then(
                          (_) => print(
                            ProgressSuccessful(
                              'create file <${Colors.green(args[index])}>',
                            ),
                          ),
                          onError: (error) => print(error),
                        ),
              );
        }
        if (optionArg == 'dir') {
          final directory = Directory(args[index]);
          await directory.exists().then(
                (alreadyExists) => alreadyExists
                    ? print(AlreadyExists('<${args[index]}>'))
                    : directory.create(recursive: true).then(
                          (_) => print(
                            ProgressSuccessful(
                              'create directory <${Colors.green(args[index])}>',
                            ),
                          ),
                          onError: (error) => print(error),
                        ),
              );
        }
      }
    }
  }
}
