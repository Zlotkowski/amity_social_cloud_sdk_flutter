import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/public/public.dart';

extension AmityUserExtenstion on AmityUser {
  UserFeedQueryBuilder getFeed() {
    return UserFeedQueryBuilder(serviceLocator(), userId!);
  }

  UserUpdateQueryBuilder update() {
    return UserUpdateQueryBuilder(serviceLocator<UpdateUserUsecase>(), userId!);
  }

  AmityMyUserRelationshipRepository me() {
    return AmityMyUserRelationshipRepository();
  }

  AmityUserRelationshipsRepository relationship() {
    return AmityUserRelationshipsRepository();
  }

  AmityUserFlagRepository report() {
    return AmityUserFlagRepository(userId: userId!);
  }

  /* begin_public_function 
  id: user.check_flag_by_me
  */
  /// check if user is flagged by me
  bool get isFlaggedByMe {
    if (hashFlag == null) return false;
    return (flaggedByMe ?? false) ||
        BloomFilter(hash: (hashFlag!['hash'] as String), m: hashFlag!['bits'] as int, k: hashFlag!['hashes'] as int)
            .mightContains(AmityCoreClient.getUserId());
  }
  //* end_public_function */
}
