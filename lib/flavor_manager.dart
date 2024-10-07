import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor {
  production,
  staging,
  dev,
}

class FlavorManager {
  static Flavor appFlavor = Flavor.staging;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'Market News App';
      case Flavor.staging:
        return '[Stg]-Market News App';
      case Flavor.dev:
        return '[Dev]-Market News App';
    }
  }

  static String get envFileName {
    switch (appFlavor) {
      case Flavor.production:
        return 'assets/env/.prod.env';
      case Flavor.staging:
        return 'assets/env/.stg.env';
      case Flavor.dev:
        return 'assets/env/.dev.env';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.production:
        return dotenv.get('BASE_URL');
      case Flavor.staging:
        return dotenv.get('BASE_URL');
      case Flavor.dev:
        return dotenv.get('BASE_URL');
    }
  }

  static String get token {
    switch (appFlavor) {
      case Flavor.production:
        return dotenv.get('API_KEY');
      case Flavor.staging:
        return dotenv.get('API_KEY');
      case Flavor.dev:
        return dotenv.get('API_KEY');
    }
  }
}
