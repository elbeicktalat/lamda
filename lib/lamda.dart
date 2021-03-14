import 'package:lamda/commands/cut.dart';
import 'package:lamda/commands/make.dart';
import 'package:lamda/commands/delete.dart';
import 'package:lamda/commands/rename.dart';
import 'package:lamda/commands/copy.dart';

// This version must be updated in tandem with the pubspec version.
const String appVersion = '1.0.0';
const String appName = 'lamda';

Make _make = Make();
Delete _delete = Delete();
ReName _reName = ReName();
Copy _copy = Copy();
Cut _cut = Cut();

List<Map<String, String>> _commands = [
  {_make.command: _make.description},
  {_delete.command: _delete.description},
  {_reName.command: _reName.description},
  {_copy.command: _copy.description},
  {_cut.command: _cut.description},
];

void _printListOfCommand() {
  for (var i = 0; i < _commands.length; i++) {
    _commands[i].forEach((key, value) {
      print('$key \t\t $value');
    });
  }
}

void welcome() {
  print(
      'Welcome in lamda this tool is very helpful for who like the commands line.');
  print("Here below you'll find the available commands\n");
  _printListOfCommand();
}

void run(List<String> args) {
  try {
    _make.make(args);
    _delete.delete(args);
    _reName.rename(args);
    _copy.copy(args);
    _cut.cut(args);
  } catch (error) {
    print(error);
  }
}
