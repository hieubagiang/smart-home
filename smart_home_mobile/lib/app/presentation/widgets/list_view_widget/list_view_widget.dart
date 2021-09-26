import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smart_home_mobile/app/presentation/utils/utils.dart';
import 'package:smart_home_mobile/app/presentation/widgets/empty_data_widget.dart';

class ListViewWidget extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ScrollController? scrollController;
  final Widget? separator;
  final EdgeInsets? padding;
  final bool? showEmptyWidget;
  final Widget? emptyWidget;
  final Function(bool)? refreshCallback;
  final Axis? scrollDirection;
  final DataState state;

  ListViewWidget({
    Key? key,
    required this.itemBuilder,
    this.itemCount = 0,
    this.scrollController,
    this.separator,
    this.padding,
    this.showEmptyWidget = false,
    this.emptyWidget,
    this.refreshCallback,
    this.scrollDirection = Axis.vertical,
    this.state = DataState.none,
  }) : super(key: key);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  final _refreshController = RefreshController(initialRefresh: false);

  bool _disableScroll() => widget.state == DataState.refreshing;

  @override
  void didUpdateWidget(covariant ListViewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state != DataState.refreshing) {
      _refreshController.refreshCompleted();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.showEmptyWidget!
            ? (widget.emptyWidget ?? EmptyDataWidget())
            : Container(),
        SmartRefresher(
          onRefresh: () {
            _refreshController.refreshCompleted();
            if (widget.refreshCallback != null) {
              widget.refreshCallback?.call(true);
              _refreshController.refreshCompleted();
            } else {
              _refreshController.refreshCompleted();
            }
          },
          enablePullDown: true,
          controller: _refreshController,
          header: MaterialClassicHeader(),
          child: ListView.separated(
            scrollDirection: widget.scrollDirection!,
            controller: widget.scrollController,
            padding: widget.padding ??
                const EdgeInsets.only(
                  left: 0,
                  right: 0,
                  bottom: 40,
                  top: 0,
                ),
            physics: _disableScroll()
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            itemBuilder: widget.itemBuilder,
            itemCount: widget.itemCount,
            separatorBuilder: (context, index) {
              return widget.separator ?? Container();
            },
          ),
        ),
      ],
    );
  }
}
