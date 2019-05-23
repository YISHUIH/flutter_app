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
  const MyRefreshDemo(
      {@required this.child,
      this.notificationPredicate = defaultScrollNotificationPredicate,
      this.headHeight = 150.0,
      this.footHeight = -150.0})
      : assert(child != null),
        assert(notificationPredicate != null);

  final Widget child;
  final ScrollNotificationPredicate notificationPredicate;
  final double headHeight;
  final double footHeight;

  @override
  _MyRefreshDemoState createState() => _MyRefreshDemoState();
}

class _MyRefreshDemoState extends State<MyRefreshDemo> {
  _RefreshIndicatorMode _mode;
  bool _isIndicatorAtTop;
  double _offest = 0.0;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (!widget.notificationPredicate(notification)) {
      return false;
    }

    if (notification is ScrollUpdateNotification) {
      if (_mode != null) {
        setState(() {
          _offest = 0.0;
        });
      }
    }

    if (notification is ScrollStartNotification) {
      //开始
      setState(() {
        _isIndicatorAtTop = true;
        _mode = _RefreshIndicatorMode.drag;
      });
    }

    if (notification is OverscrollNotification) {
      //拖动过程
      Offset delta = notification.dragDetails.delta;
      //拖动方向
      var direction = delta.direction;
      if (direction > 0) {
        //下拉
        _mode = _RefreshIndicatorMode.drag;
      } else {
        //上拉
        _mode = _RefreshIndicatorMode.drag;
      }
      setState(() {
        _offest += delta.dy;
      });
      return true;
    }
    if (notification is ScrollEndNotification) {
      //结束

      if (_offest > widget.headHeight / 3 * 2) {
        _offest = widget.headHeight;
      } else if (_offest < widget.footHeight / 3 * 2) {
        _offest = widget.footHeight;
      } else {
        _offest = 0.0;
        _isIndicatorAtTop = false;
      }
      setState(() {});
    }
    return false;
  }

  bool _handleGlowNotification(OverscrollIndicatorNotification notification) {
    if (notification.depth != 0) {
      return false;
    }
    if (notification.leading) {
//      print("glow===$notification ====== 刷新");
    } else {
//      print("glow===$notification ====== 更多");
    }
    if (_mode == _RefreshIndicatorMode.drag) {
      notification.disallowGlow();
      return true;
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
      return Transform(
        transform: Matrix4.identity()..translate(0.0, _offest),
        child: child,
      );
    }

    return Stack(
      children: <Widget>[
        Transform(
          transform: Matrix4.identity()..translate(0.0, _offest),
          child: child,
        ),
        Positioned(
            left: 0.0,
            right: 0.0,
            top: -150,
            height: 150,
            child: Transform(
              transform: Matrix4.identity()..translate(0.0, _offest),
              child: Center(
                child: Text("下拉刷新"),
              ),
            )),
        Positioned(
            bottom: -150,
            height: 150,
            left: 0.0,
            right: 0.0,
            child: Transform(
              transform: Matrix4.identity()..translate(0.0, _offest),
              child: Center(
                child: Text("上拉加载更多"),
              ),
            )),
      ],
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
