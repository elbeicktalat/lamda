import 'package:lamda/src/colors.dart';

class AlreadyExists implements Exception {
  final String message;

  AlreadyExists(this.message);

  @override
  String toString() {
    return Colors.red('$message already exists!');
  }
}
