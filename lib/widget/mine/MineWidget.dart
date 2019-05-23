/**
 * Copyright , 2015-2019, 健康无忧网络科技有限公司 <br>
 * Author: 陈刘磊 1070379530@qq.com <br>
 * Date: 2019/4/29 16:03    <br>
 * Description: 我的  <br>
 */
import 'package:flutter/material.dart';

class MineWidget extends StatefulWidget {
  @override
  _MineWidgetState createState() => _MineWidgetState();
}

class _MineWidgetState extends State<MineWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MyRefreshDemo(
            child: Stack(
      children: <Widget>[
        Container(
          child: Text("dddddddddd"),
          color: Colors.blue,
        ),
        ListView(
          shrinkWrap: true,
          children: _getChild(),
        )
      ],
    )));
  }
}

List<Widget> _getChild() {
  return List.generate(20, (index) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Text("ssssss"),
    );
  });
}

class MyRefreshDemo extends StatefulWidget {
  const MyRefreshDemo({
    @required this.child,
    this.notificationPredicate = defaultScrollNotificationPredicate,
  })  : assert(child != null),
        assert(notificationPredicate != null);

  final Widget child;
  final ScrollNotificationPredicate notificationPredicate;

  @override
  _MyRefreshDemoState createState() => _MyRefreshDemoState();
}

class _MyRefreshDemoState extends State<MyRefreshDemo> {
  _RefreshIndicatorMode _mode;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (!widget.notificationPredicate(notification)) {
      return false;
    }

    if (notification is ScrollStartNotification) {
      print(notification);
      print(notification.metrics);
      print(notification.metrics.axisDirection);

    }
    return false;
  }

  bool _handleGlowNotification(OverscrollIndicatorNotification notification) {
    if (notification.depth != 0) {
      return false;
    }
    if (notification.leading) {
      print("glow===$notification ====== 刷新");

    } else {
      print("glow===$notification ====== 更多");
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final Widget child = NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleGlowNotification,
        child: widget.child,
      ),
    );
    if (_mode == null) {
      return child;
    }

    return Container(
      child: Text("sssssssssss"),
    );
  }
}

enum _RefreshIndicatorMode {
  drag, // Pointer is down.
  armed, // Dragged far enough that an up event will run the onRefresh callback.
  snap, // Animating to the indicator's final "displacement".
  refresh, // Running the refresh callback.
  done, // Animating the indicator's fade-out after refreshing.
  canceled, // Animating the indicator's fade-out after not arming.
  loadMore
}
