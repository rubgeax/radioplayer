// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_screen_wake/flutter_screen_wake.dart';

Future<void> sleepLock() async {
  try {
    // Keep the screen on
    await FlutterScreenWake.keepOn(true);
  } catch (e) {
    print("Failed to set sleep lock: $e");
  }
}
