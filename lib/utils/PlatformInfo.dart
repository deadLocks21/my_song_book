import 'dart:io';

class PlatformInfo {
  static bool isDesktopOS() {
    return Platform.isMacOS || Platform.isLinux || Platform.isWindows;
  }
}