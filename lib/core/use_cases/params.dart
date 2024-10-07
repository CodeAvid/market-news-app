import 'package:equatable/equatable.dart';

class Params<T extends Object> extends Equatable {
  const Params(this.t);

  final T t;

  @override
  List<Object> get props => [t];
}
