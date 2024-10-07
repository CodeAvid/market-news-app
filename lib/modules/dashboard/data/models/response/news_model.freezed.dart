// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return _NewsModel.fromJson(json);
}

/// @nodoc
mixin _$NewsModel {
  String get category => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get headline => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get datetime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsModelCopyWith<NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsModelCopyWith<$Res> {
  factory $NewsModelCopyWith(NewsModel value, $Res Function(NewsModel) then) =
      _$NewsModelCopyWithImpl<$Res, NewsModel>;
  @useResult
  $Res call(
      {String category,
      String source,
      String headline,
      String image,
      @DateTimeConverter() DateTime datetime});
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res, $Val extends NewsModel>
    implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? source = null,
    Object? headline = null,
    Object? image = null,
    Object? datetime = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      headline: null == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsModelImplCopyWith<$Res>
    implements $NewsModelCopyWith<$Res> {
  factory _$$NewsModelImplCopyWith(
          _$NewsModelImpl value, $Res Function(_$NewsModelImpl) then) =
      __$$NewsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String source,
      String headline,
      String image,
      @DateTimeConverter() DateTime datetime});
}

/// @nodoc
class __$$NewsModelImplCopyWithImpl<$Res>
    extends _$NewsModelCopyWithImpl<$Res, _$NewsModelImpl>
    implements _$$NewsModelImplCopyWith<$Res> {
  __$$NewsModelImplCopyWithImpl(
      _$NewsModelImpl _value, $Res Function(_$NewsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? source = null,
    Object? headline = null,
    Object? image = null,
    Object? datetime = null,
  }) {
    return _then(_$NewsModelImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      headline: null == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsModelImpl implements _NewsModel {
  const _$NewsModelImpl(
      {this.category = '',
      this.source = '',
      this.headline = '',
      this.image = '',
      @DateTimeConverter() required this.datetime});

  factory _$NewsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsModelImplFromJson(json);

  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final String source;
  @override
  @JsonKey()
  final String headline;
  @override
  @JsonKey()
  final String image;
  @override
  @DateTimeConverter()
  final DateTime datetime;

  @override
  String toString() {
    return 'NewsModel(category: $category, source: $source, headline: $headline, image: $image, datetime: $datetime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsModelImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.headline, headline) ||
                other.headline == headline) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, category, source, headline, image, datetime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      __$$NewsModelImplCopyWithImpl<_$NewsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsModelImplToJson(
      this,
    );
  }
}

abstract class _NewsModel implements NewsModel {
  const factory _NewsModel(
      {final String category,
      final String source,
      final String headline,
      final String image,
      @DateTimeConverter() required final DateTime datetime}) = _$NewsModelImpl;

  factory _NewsModel.fromJson(Map<String, dynamic> json) =
      _$NewsModelImpl.fromJson;

  @override
  String get category;
  @override
  String get source;
  @override
  String get headline;
  @override
  String get image;
  @override
  @DateTimeConverter()
  DateTime get datetime;
  @override
  @JsonKey(ignore: true)
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
