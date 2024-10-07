import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market_news_app/core/extensions/extension.dart';
import 'package:market_news_app/modules/dashboard/domain/entities/news_entity.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    @Default('') String category,
    @Default('') String source,
    @Default('') String headline,
    @Default('') String image,
    @DateTimeConverter() required DateTime datetime,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
}

extension NewsModelX on NewsModel {
  NewsEntity toEntity() {
    return NewsEntity(
      category: category,
      source: source,
      headline: headline,
      image: image,
      datetime: datetime.formatDate(),
    );
  }
}
