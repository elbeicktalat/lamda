import 'dart:io';

import 'package:lamda/src/command.dart';

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
      final path = Directory.current.uri.toString().substring(8);
      await file.copy('${path + args[2] + '/' + args[1]}');
      await file.delete().then((value) => print(
          'cut \x1B[31m<${args[1]}>\x1B[0m into \x1B[32m<${args[2]}>\x1B[0m is successfully!'));
    }
  }
}