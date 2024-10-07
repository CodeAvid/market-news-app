import 'package:fpdart/fpdart.dart';
import 'package:market_news_app/core/network/failures.dart';

/// A typedef for a `Future`
/// that returns an `Either` type with a `Failure` or a generic type `T`.
typedef FutureEither<T> = Future<Either<Failure, T>>;

/// A typedef for a `Future`
/// that returns an `Either` type with a `Failure` or `void`.
typedef FutureEitherVoid = Future<Either<Failure, void>>;

/// A typedef for a `Map` with `String` keys and `dynamic` values.
typedef StrDynamicMap = Map<String, dynamic>;

/// A typedef for a `List` of `Map` objects with `String` keys and `dynamic` values.
typedef StrDynamicMapList = List<Map<String, dynamic>>;
