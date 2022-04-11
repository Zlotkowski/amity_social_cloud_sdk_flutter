import 'package:amity_sdk/lib.dart';

class AmityUserFeedQuery {
  /* begin_sample_code
    gist_id: 1545e4340a8f22902ebcdb3cd986cc6e
    filename: AmityUserFeedQuery.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter get post example
    */
  final amityPosts = <AmityPost>[];
  late PagingController<AmityPost> _controller;

  void initPagingController(String userId) {
    //inititate the PagingController
    _controller = PagingController(
      pageFuture: (token) => AmitySocialClient.newFeedRepository()
          .getUserFeed(userId)
          .getPagingData(token: token, limit: 20),
      pageSize: 20,
    )..addListener(
        () {
          if (_controller.error == null) {
            //handle results, we suggest to clear the previous items
            //and add with the latest _controller.loadedItems
            amityPosts.clear();
            amityPosts.addAll(_controller.loadedItems);
            //update widgets
          } else {
            //error on pagination controller
            //update widgets
          }
        },
      );
  }

//when the ListView widget is reached the bottom of the
//page, you need to trigger next page by calling
//_controller.fetchNextPage()
  void loadMore() {
    _controller.fetchNextPage()
        //optional
        .then((value) {
      //success
    });
  }
  /* end_sample_code */
}
