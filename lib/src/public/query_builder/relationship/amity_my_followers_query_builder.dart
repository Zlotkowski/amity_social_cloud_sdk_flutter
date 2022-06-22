// ignore_for_file: unused_field

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class AmityMyFollowersQueryBuilder {
  late GetMyFollowersUsecase _useCase;
  AmityFollowStatusFilter _status = AmityFollowStatusFilter.ALL;

  AmityMyFollowersQueryBuilder({required GetMyFollowersUsecase useCase}) {
    _useCase = useCase;
  }

  AmityMyFollowersQueryBuilder status(AmityFollowStatusFilter status) {
    _status = status;
    return this;
  }

  Future<Tuple2<List<AmityFollowRelationship>, String>> getPagingData(
      {String? token, int? limit}) async {
    final request = FollowRequest();
    request.status = _status.value;

    if (token != null) {
      request.token = token;
    }
    if (limit != null) {
      request.limit = limit;
    }

    final data = await _useCase.get(request);

    return data;
  }
}
