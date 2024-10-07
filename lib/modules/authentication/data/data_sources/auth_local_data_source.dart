import 'dart:async';
import 'dart:convert';

import 'package:market_news_app/app/app_local_storage.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/storage/storage_key.dart';
import 'package:market_news_app/modules/authentication/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<bool> saveUser(UserModel user);
  Future<UserModel?> getUser();

  Future<bool> markEnablePushNotificationScreenAsSeen({bool status = true});
  Future<bool> getPushNotificationCompletionStatus();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  AuthLocalDataSourceImpl({required this.appLocalStorage});

  final AppLocalStorage appLocalStorage;

  @override
  Future<bool> saveUser(UserModel user) async {
    return Future.delayed(
      const Duration(seconds: 3),
      () async {
        return appLocalStorage.set(
          StorageKey.user,
          jsonEncode(user.toJson()),
        );
      },
    );
  }

  @override
  Future<UserModel?> getUser() async {
    final storedUserSting = await appLocalStorage.getString(StorageKey.user);
    if (storedUserSting != null) {
      return UserModel.fromJson(jsonDecode(storedUserSting) as StrDynamicMap);
    }
    return null;
  }

  @override
  Future<bool> getPushNotificationCompletionStatus() async {
    return await appLocalStorage.getBool(StorageKey.pushNotificationStatus) ?? false;
  }

  @override
  Future<bool> markEnablePushNotificationScreenAsSeen({bool status = false}) async {
    return appLocalStorage.setBool(
      StorageKey.pushNotificationStatus,
      data: status,
    );
  }
}
