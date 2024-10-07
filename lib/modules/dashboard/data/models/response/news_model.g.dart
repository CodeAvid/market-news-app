// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      category: json['category'] as String? ?? '',
      source: json['source'] as String? ?? '',
      headline: json['headline'] as String? ?? '',
      image: json['image'] as String? ?? '',
      datetime:
          const DateTimeConverter().fromJson((json['datetime'] as num).toInt()),
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'source': instance.source,
      'headline': instance.headline,
      'image': instance.image,
      'datetime': const DateTimeConverter().toJson(instance.datetime),
    };
