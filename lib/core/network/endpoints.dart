import 'package:market_news_app/flavor_manager.dart';

/// A class that provides various endpoints for network requests.
class Endpoints {
  // Private constructor to prevent instantiation.
  Endpoints._();

  /// Gets the base URL from the `FlavorManager`.
  static String get baseUrl => FlavorManager.baseUrl;

  /// The scheme used for the URIs (e.g., 'https').
  static const scheme = 'https';

  /// Constructs a base URI with the given path, query, and query parameters.
  ///
  /// \param path The path for the URI.
  /// \param query The query string for the URI.
  /// \param queryParameters Additional query parameters for the URI.
  /// \return A `Uri` object constructed with the given parameters.
  ///
  /// Example:
  /// ```dart
  /// final uri = Endpoints.baseUri(path: 'api/v1/resource');
  /// ```
  static Uri baseUri({
    required String path,
    String? query,
    Map<String, dynamic>? queryParameters,
  }) =>
      Uri(
        scheme: scheme,
        host: baseUrl,
        path: path,
        query: query,
        queryParameters: queryParameters,
      );

  /// Constructs an authentication base URI with the given path.
  ///
  /// \param path The path for the authentication URI.
  /// \return A `Uri` object constructed with the given path.
  ///
  /// Example:
  /// ```dart
  /// final newsUri = Endpoints.newsBaseUri(path: 'general');
  /// ```
  static Uri newsBaseUri({
    required String path,
  }) =>
      baseUri(
        path: '/news/$path',
      );

  static Uri get generalNews => newsBaseUri(path: '');
}
