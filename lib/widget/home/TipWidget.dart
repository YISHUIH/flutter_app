import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ge/mode/Banner.dart';
import 'package:flutter_ge/res/color.dart';

///Copyright , 2015-2019, 健康无忧网络科技有限公司 <br>
///Author: 陈刘磊 1070379530@qq.com <br>
///Date: 2019/5/8 16:19    <br>
///Description: 首页通知模块   <br>
class TipWidget extends StatefulWidget {
  List<BannerInfo> _bannerList = List();

  TipWidget(this._bannerList);

  @override
  _TipWidgetState createState() => _TipWidgetState();
}

class _TipWidgetState extends State<TipWidget> {




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: colors.them_bg_gray),
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.only(left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              "通知",
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 14.0),
            ),
            flex: 0,
          ),
          Expanded(
            child: TipPageViewWidget(widget._bannerList),
            flex: 2,
          ),
          Expanded(
            child: Icon(
              Icons.keyboard_arrow_right,
              color: colors.them_text_gray,
            ),
            flex: 0,
          )
        ],
      ),
    );
  }
}

class TipPageViewWidget extends StatelessWidget {
  List<BannerInfo> _bannerList = List();
  List<Widget> _childrenList = List();

  var _pageController = PageController();
  var _timer;
  int _index = 0;

  TipPageViewWidget(this._bannerList);

  bool _isEndScroll = true;

  @override
  Widget build(BuildContext context) {
    var _container = Container(
      height: 50,
      child: NotificationListener(
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          children: _getChildern(),
          onPageChanged: (index) {
            _index = index;
          },
        ),
        onNotification: (onNotification) {
          if (onNotification is ScrollEndNotification ||
              onNotification is UserScrollNotification) {
            _isEndScroll = true;
          } else {
            _isEndScroll = false;
          }
          return false;
        },
      ),
    );
    return _container;
  }

  List<Widget> _getChildern() {
    for (int i = 0; i < _bannerList.length; i++) {
      var title = _bannerList[i].title;
      _childrenList.add(FlatButton(
          onPressed: () {
            print(title);
          },
          child: Row(children: <Widget>[
            Text(
              title,
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ])));
    }
    return _childrenList;
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (s) {
      if (_isEndScroll) {
        _index += 1;
        if (_index == _childrenList.length) {
          _index = 0;
          _pageController.jumpToPage(_index);
        } else {
          _pageController.animateToPage(_index,
              duration: Duration(seconds: 1), curve: Curves.linear);
        }
      }
    });
  }

  void clearTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
}
