import 'package:lamda/lamda.dart' as lamda;

void main(List<String> args) {
  if (args.isNotEmpty) {
    lamda.run(args);
  } else {
    lamda.welcome();
  }
}
