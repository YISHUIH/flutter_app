import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ge/mode/Banner.dart';
import 'package:flutter_ge/util/UtilToast.dart';

///Copyright , 2015-2019, 健康无忧网络科技有限公司 <br>
///Author: 陈刘磊 1070379530@qq.com <br>
///Date: 2019/5/6 17:02    <br>
///Description: 首页Banner轮播图部分   <br>

class BannerWidget extends StatefulWidget {
  List<BannerInfo> _bannerList = List();

  BannerWidget(this._bannerList);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  //radioButton显示
  int _index = 0;

  //pageView控制器
  PageController _pageController = PageController();


  List<Widget> _list = List();
  bool _isEndScroll = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          NotificationListener(
            child: _getViewPage(),

            ///检查手指和自动播放的是否冲突，如果滚动停止开启自动播放，反之停止自动播放
            onNotification: (notification) {
              if (notification is ScrollEndNotification ||
                  notification is UserScrollNotification) {
                _isEndScroll = true;
              } else {
                _isEndScroll = false;
              }
              return false;
            },
          ),
          _getIndicator()
        ],
      ),
    );
  }

  ///轮播图部分
  Widget _getViewPage() {
    showBanner();
    return Container(
      height: 112,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: _list,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }

  void showBanner() {
    _list.clear();
    for (int i = 0; i < widget._bannerList.length; i++) {
      String url = widget._bannerList[i].imageUrl;
      _list.add(
        GestureDetector(
            onTap: () {Toast.toast(context, url);},
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.fill)))),
      );
    }
  }

  List<Widget> _itemList = List();

  ///指示器
  Widget _getIndicator() {
    _itemList.clear();
    for (int i = 0; i < _list.length; i++) {
      _itemList.add(new SizedBox(
        width: 9.0,
        height: 21.0,
        child: new Container(
          margin: EdgeInsets.fromLTRB(4, 8, 0, 8),
          decoration: BoxDecoration(
              color: i == _index ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(2.5))),
        ),
      ));
    }
    startMove();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _itemList,
    );
  }

  Timer _timer;

  void startMove() {
    clearTimer();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_isEndScroll) {
        var i = _index + 1;
        if (i == _list.length) {
          i = 0;
          _pageController.jumpToPage(i);
        } else {
          _pageController.animateToPage(i,
              duration: Duration(seconds: 1), curve: Curves.linear);
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    clearTimer();
    super.dispose();
  }

  void clearTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
}
