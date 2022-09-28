import 'dart:async';

import 'package:amity_sdk/src/domain/domain.dart';

class PostByIdQueryBuilder {
  late GetPostByIdUseCase _useCase;
  late String _postId;

  PostByIdQueryBuilder(
      {required GetPostByIdUseCase useCase, required String postId}) {
    _useCase = useCase;
    _postId = postId;
  }

  // PostByIdQueryBuilder getPostById(String postId) {
  //   _postId = postId;
  //   return this;
  // }

  Future<AmityPost> get() {
    return _useCase.get(_postId);
  }

  StreamController<AmityPost> listen() {
    return _useCase.listen(_postId);
  }
}
