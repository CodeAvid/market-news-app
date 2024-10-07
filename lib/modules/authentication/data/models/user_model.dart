import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market_news_app/modules/authentication/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String firstName,
    required String lastName,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      firstName: firstName,
      lastName: lastName,
    );
  }
}
