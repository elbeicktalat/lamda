class Colors {
  static String black(String text) {
    return '\x1B[30m$text\x1B[0m';
  }

  static String red(String text) {
    return '\x1B[31m$text\x1B[0m';
  }

  static String green(String text) {
    return '\x1B[32m$text\x1B[0m';
  }

  static String Yellow(String text) {
    return '\x1B[33m$text\x1B[0m';
  }

  static String blue(String text) {
    return '\x1B[34m$text\x1B[0m';
  }

  static String magenta(String text) {
    return '\x1B[35m$text\x1B[0m';
  }

  static String cyan(String text) {
    return '\x1B[36m$text\x1B[0m';
  }

  static String white(String text) {
    return '\x1B[37m$text\x1B[0m';
  }
}
