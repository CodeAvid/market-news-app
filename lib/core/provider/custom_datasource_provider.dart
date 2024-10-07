// ignore_for_file: comment_references

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// {@template datasource_provider}
/// Takes a [Create] function that is responsible for creating the repository
/// and a `child` which will have access to the datasource via
/// `DataSourceProvider.of(context)`.
/// It is used as a dependency injection (DI) widget so that a single instance
/// of a repository can be provided to multiple widgets within a subtree.
///
/// ```dart
/// DataSourceProvider(
///   create: (context) => DataSourceA(),
///   child: ChildA(),
/// );
/// ```
///
/// Lazily creates the repository unless `lazy` is set to `false`.
///
/// ```dart
/// DataSourceProvider(
///   lazy: false,`
///   create: (context) => RepositoryA(),
///   child: ChildA(),
/// );
/// ```
/// {@endtemplate}
class DataSourceProvider<T> extends Provider<T> {
  /// {@macro repository_provider}
  DataSourceProvider({
    required super.create,
    super.key,
    super.child,
    super.lazy,
  }) : super(
          dispose: (_, __) {},
        );

  /// Takes a repository and a [child] which will have access to the repository.
  /// A new repository should not be created in `RepositoryProvider.value`.
  /// Repositories should always be created using the default constructor
  /// within the [Create] function.
  DataSourceProvider.value({
    required super.value,
    super.key,
    super.child,
  }) : super.value();

  /// Method that allows widgets to access a repository instance as long as
  /// their `BuildContext` contains a [DataSourceProvider] instance.
  static T of<T>(BuildContext context, {bool listen = false}) {
    try {
      return Provider.of<T>(context, listen: listen);
    } on ProviderNotFoundException catch (e) {
      if (e.valueType != T) rethrow;
      throw FlutterError(
        '''
        RepositoryProvider.of() called with a context that does not contain a repository of type $T.
        No ancestor could be found starting from the context that was passed to RepositoryProvider.of<$T>().

        This can happen if the context you used comes from a widget above the RepositoryProvider.

        The context used was: $context
        ''',
      );
    }
  }
}
