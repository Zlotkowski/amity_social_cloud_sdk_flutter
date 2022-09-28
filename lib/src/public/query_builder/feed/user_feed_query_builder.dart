import 'dart:async';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// [UserFeedQueryBuilder]
class UserFeedQueryBuilder {
  final GetUserFeedUsecase _usecase;
  final GetUserFeedRequest _request;

  /// Init [UserFeedQueryBuilder]
  UserFeedQueryBuilder(this._usecase, String userId)
      : _request = GetUserFeedRequest(userId: userId);

  UserFeedQueryBuilder includeDeleted(bool flag) {
    _request.isDeleted = flag;
    return this;
  }

  UserFeedQueryBuilder types(List<AmityDataType> types) {
    _request.dataTypes = types.map((e) => e.value).toList();
    return this;
  }

  UserFeedQueryBuilder sortBy(AmityUserFeedSortOption sortOption) {
    _request.sortBy = sortOption.value;
    return this;
  }

  Future<PageListData<List<AmityPost>, String>> getPagingData(
      {String? token, int? limit}) async {
    _request.options = OptionsRequest();

    if (token != null) {
      _request.options!.token = token;
    }
    if (limit != null) {
      _request.options!.limit = limit;
    }

    final data = await _usecase.get(_request);

    return data;
  }

  StreamController<PageListData<List<AmityPost>, String>> getPagingDataStream(
      {String? token, int? limit}) {
    _request.options = OptionsRequest();
    if (token != null) {
      _request.options!.token = token;
    }
    if (limit != null) {
      _request.options!.limit = limit;
    }

    return _usecase.listen(_request);
  }
}
