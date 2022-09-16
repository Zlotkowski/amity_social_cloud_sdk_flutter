import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/channel/create_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/channel/get_channel_request.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:dio/dio.dart';

/// [ChannelApiInterfaceImpl]
class ChannelApiInterfaceImpl extends ChannelApiInterface {
  /// init [ChannelApiInterfaceImpl]
  ChannelApiInterfaceImpl({required this.httpApiClient});

  /// Http Client
  final HttpApiClient httpApiClient;

  @override
  Future<CreateChannelResponse> createChannel(CreateChannelRequest request) {
    // TODO: implement createChannel
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteChannel(String channelId) {
    // TODO: implement deleteChannel
    throw UnimplementedError();
  }

  @override
  Future<CreateChannelResponse> getChannel(String channelId) async {
    try {
      final data = await httpApiClient().get('$CHANNEL_V3/$channelId');
      return CreateChannelResponse.fromJson(data.data);
    } on DioError catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }

  @override
  Future<CreateChannelResponse> getChannelQuery(GetChannelRequest request) {
    // TODO: implement getChannelQuery
    throw UnimplementedError();
  }

  @override
  Future<CreateChannelResponse> updateChannel(CreateChannelRequest request) {
    // TODO: implement updateChannel
    throw UnimplementedError();
  }
}
