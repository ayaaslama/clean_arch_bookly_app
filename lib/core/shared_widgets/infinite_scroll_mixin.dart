import 'package:flutter/material.dart';

mixin InfiniteScrollMixin<T extends StatefulWidget> on State<T> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> loadMoreItems(BuildContext context) async {}

  void _scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength && !isLoading) {
      setState(() {
        isLoading = true;
      });

      await loadMoreItems(context);

      setState(() {
        isLoading = false;
      });
    }
  }
}
