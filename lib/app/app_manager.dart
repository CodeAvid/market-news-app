import 'package:flutter/material.dart';

class AppManager {
  /// This method is responsible for initializing the necessary dependencies of
  ///  the application. It can be called at the beginning of the app's lifecycle
  /// to set up configurations, register services, initialize databases, or
  /// perform any other required initialization tasks.

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
