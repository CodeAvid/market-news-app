import 'package:market_news_app/modules/authentication/data/models/user_model.dart';

class UserParams {
  UserParams({
    required this.firstName,
    required this.lastName,
  });

  final String firstName;
  final String lastName;
}

extension UserParamsX on UserParams {
  UserModel toModel() {
    return UserModel(
      firstName: firstName,
      lastName: lastName,
    );
  }
}
