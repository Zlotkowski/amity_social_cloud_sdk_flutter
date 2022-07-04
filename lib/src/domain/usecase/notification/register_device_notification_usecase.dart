import 'dart:async';
import 'dart:io' show Platform;

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/register_notification_request.dart';
import 'package:amity_sdk/src/core/usercase/usecase.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class RegisterDeviceNotificationUseCase extends UseCase<void, String> {
  final NotificationRepo notificationRepo;
  final AccountRepo accountRepo;

  RegisterDeviceNotificationUseCase(
      {required this.notificationRepo, required this.accountRepo});

  @override
  Future<void> get(String params) async {
    final currentUser = AmityCoreClient.getCurrentUser();
    final account = accountRepo.getAccount(currentUser.userId!);
    if (account?.userId == null || account?.deviceId == null) {
      throw NullThrownError();
    }
    var platform = "";
    if (Platform.isAndroid) {
      platform = "android";
    } else if (Platform.isIOS) {
      platform = "android";
    } else {
      throw NullThrownError();
    }
    final RegisterNotificationRequest request = RegisterNotificationRequest(
        userId: account!.userId!,
        deviceId: account.deviceId!,
        token: params,
        provider: "fcm",
        platform: platform);
    return notificationRepo.registerNotification(request);
  }

  @override
  Stream<void> listen(String params) {
    // TODO: implement listen
    throw UnimplementedError();
  }
}
