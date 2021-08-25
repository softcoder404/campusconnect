import 'dart:io';

import 'package:flutter/widgets.dart';

enum SystemPlatform { apple, google, microsoft, linux, unknown }

SystemPlatform platform() {
  if (Platform.isIOS || Platform.isMacOS) {
    return SystemPlatform.apple;
  } else if (Platform.isWindows) {
    return SystemPlatform.microsoft;
  } else if (Platform.isAndroid || Platform.isFuchsia) {
    return SystemPlatform.google;
  } else if (Platform.isLinux) {
    return SystemPlatform.linux;
  }

  return SystemPlatform.unknown;
}

Widget platformWidget({Widget? android, Widget? ios}) {
  assert(android != null);
  assert(ios != null);

  if (platform() == SystemPlatform.apple) {
    return ios!;
  }
  return android!;
}