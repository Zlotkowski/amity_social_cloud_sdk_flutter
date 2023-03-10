import 'package:amity_sdk/src/core/socket/event/post/post_event_listener.dart';

/// [PostCreateEventListener]
class PostRemoveReactionEventListener extends PostEventListener {
  @override
  String getEventName() {
    return 'post.removeReaction';
  }
}
