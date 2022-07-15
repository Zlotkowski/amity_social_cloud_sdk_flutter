import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:dio/dio.dart';

/// Implementation of Poll Api Interface
class PollApiInterfaceImpl extends PollApiInterface {
  /// Http clinet to make API request
  final HttpApiClient httpApiClient;

  /// Init [PollApiInterfaceImpl]
  PollApiInterfaceImpl(this.httpApiClient);

  @override
  Future<CreatePostResponse> createPoll(CreatePollRequest request) async {
    try {
      final data = await httpApiClient().post(POLL_V3, data: request);
      return CreatePostResponse.fromJson(data.data);
    } on DioError catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<CreatePostResponse> votePoll(PollVoteRequest request) async {
    try {
      final data = await httpApiClient()
          .post('$POLL_V3/${request.pollId}/votes', data: request);
      return CreatePostResponse.fromJson(data.data);
    } on DioError catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    } catch (error) {
      rethrow;
    }
  }
}