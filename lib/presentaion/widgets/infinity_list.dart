import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stackoverflow_client/res/constants.dart';

class InfinityList extends StatefulWidget {
  final InfinityListController controller;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final Widget Function(BuildContext, dynamic) separatorBuilder;

  const InfinityList({
    @required this.itemBuilder,
    @required this.separatorBuilder,
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  _InfinityListState createState() => _InfinityListState();
}

class _InfinityListState extends State<InfinityList> {
  @override
  Widget build(BuildContext context) => StreamBuilder<Object>(
        stream: widget.controller.itemsStream,
        builder: (context, snapshot) => ListView.separated(
          itemBuilder: (ctx, index) => _ItemListContainer(
            itemCreated: () => widget.controller.handleItemCreated(index),
            child: widget.controller.currentItems[index] is _LoadinIndicatorFlag
                ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : widget.itemBuilder(
                    ctx,
                    widget.controller.currentItems[index],
                  ),
          ),
          separatorBuilder: (ctx, i) => widget.separatorBuilder(
            ctx,
            widget.controller.currentItems[i],
          ),
          itemCount: widget.controller.currentItems.length,
        ),
      );
}

class _LoadinIndicatorFlag {}

class InfinityListController {
  final Future<List<dynamic>> Function(int page) loadPage;

  final _itemsController = StreamController<List<dynamic>>();
  Stream<List<dynamic>> get itemsStream => _itemsController.stream;

  List<dynamic> currentItems = <dynamic>[];
  int _currentPage = 1;

  InfinityListController(this.loadPage) {
    initialLoading();
  }

  void initialLoading() async {
    final result = await loadPage(_currentPage);
    if (result != null) {
      currentItems.addAll(result);
      _itemsController.sink.add(currentItems);
    }
  }

  void handleItemCreated(int index) async {
    final itemPosition = index + 1;
    final requestMoreData =
        itemPosition % (chunkSize * _currentPage) == 0 && itemPosition != 0;

    if (requestMoreData) {
      final loadingIndicator = _LoadinIndicatorFlag();
      _itemsController.sink.add(currentItems..add(loadingIndicator));

      final newTags = await loadPage(++_currentPage);

      _itemsController.sink.add(currentItems
        ..addAll(newTags)
        ..remove(loadingIndicator));
    }
  }

  void dispose() {
    _itemsController.close();
  }
}

class _ItemListContainer extends StatefulWidget {
  final VoidCallback itemCreated;
  final Widget child;

  const _ItemListContainer(
      {@required this.itemCreated, @required this.child, Key key})
      : super(key: key);

  @override
  _ItemListContainerState createState() => _ItemListContainerState();
}

class _ItemListContainerState extends State<_ItemListContainer> {
  @override
  void initState() {
    super.initState();

    if (widget.itemCreated != null) {
      widget.itemCreated();
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
