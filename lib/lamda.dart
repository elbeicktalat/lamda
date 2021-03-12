import 'package:lamda/commands/cut.dart';

import 'commands/make.dart';
import 'commands/delete.dart';
import 'commands/rename.dart';
import 'commands/copy.dart';

// This version must be updated in tandem with the pubspec version.
const String appVersion = '1.0.0';
const String appName = 'lamda';

Make _make = Make();
Delete _delete = Delete();
ReName _reName = ReName();
Copy _copy = Copy();
Cut _cut = Cut();

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
