import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market_news_app/modules/dashboard/domain/entities/news_entity.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    required String category,
    // required String source,
    // required String headline,
    // required String image,
    // required String datetime,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
}

extension NewsModelX on NewsModel {
  NewsEntity toEntity() {
    return NewsEntity(
      category: category,
      source: '',
      headline: '',
      image: '',
      datetime: '',
    );
  }
}
