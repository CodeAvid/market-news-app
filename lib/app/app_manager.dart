import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:market_news_app/flavor_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;

class AppManager {
  /// This method is responsible for initializing the necessary dependencies of
  ///  the application. It can be called at the beginning of the app's lifecycle
  /// to set up configurations, register services, initialize databases, or
  /// perform any other required initialization tasks.

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    sharedPreferences = await SharedPreferences.getInstance();

    await dotenv.load(fileName: FlavorManager.envFileName);
  }
}
