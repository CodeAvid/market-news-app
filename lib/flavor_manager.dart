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

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.production:
        return 'staging-api.scrybit.app';
      case Flavor.staging:
        return 'staging-api.scrybit.app';
      case Flavor.dev:
        return 'staging-api.scrybit.app';
    }
  }
}
