import 'package:market_news_app/core/typedefs/typedefs.dart';

abstract interface class UseCase<Type, Params> {
  FutureEither<Type> call(Params params);
}
