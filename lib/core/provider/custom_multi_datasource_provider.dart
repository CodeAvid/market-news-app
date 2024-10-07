// ignore_for_file: comment_references

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// ignore: duplicate_ignore
/// {@template multi_repository_provider}
/// Merges multiple [DataSourceProvider] widgets into one widget tree.
///
/// [MultiDatasourceProvider] improves the readability and eliminates the need
/// to nest multiple [DataSourceProvider]s.
///
/// By using [MultiDatasourceProvider] we can go from:
///
/// ```dart
/// DataSourceProvider<DatasourceA>(
///   create: (context) => DatasourceA(),
///   child: DatasourceProvider<DatasourceB>(
///     create: (context) => DatasourceB(),
///     child: DatasourceProvider<DatasourceC>(
///       create: (context) => DatasourceC(),
///       child: ChildA(),
///     )
///   )
/// )
/// ```
///
/// to:
///
/// ```dart
/// MultiDatasourceProvider(
///   providers: [
///     DatasourceProvider<DatasourceA>(create: (context) => DatasourceA()),
///     DatasourceProvider<DatasourceB>(create: (context) => DatasourceB()),
///     DatasourceProvider<DatasourceC>(create: (context) => DatasourceC()),
///   ],
///   child: ChildA(),
/// )
/// ```
///
/// [MultiDataSourceProvider] converts the [DataSourceProvider] list into a tree
/// of nested [DatasourceProvider] widgets.
/// As a result, the only advantage of using [MultiDatasourceProvider] is
/// improved readability due to the reduction in nesting and boilerplate.
/// {@endtemplate}
class MultiDataSourceProvider extends MultiProvider {
  /// {@macro multi_repository_provider}
  MultiDataSourceProvider({
    required super.providers,
    required Widget super.child,
    super.key,
  });
}
