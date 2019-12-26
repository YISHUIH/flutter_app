import 'package:flutter/material.dart';

///
///Copyright , 2015-2019,  <br>
///Author:  1070379530@qq.com <br>
///Date: 2019/5/6 11:04    <br>
///Description: 类似安卓吐司的功能，消息提示   <br>
///
class Toast {
  ///
  ///toast靠它加到屏幕上
  ///
  static OverlayEntry _overlayEntry;
  static String _msg;

  static void toast(BuildContext context, String msg) async {
    assert(msg != null);
    _msg = msg;
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (BuildContext c) => Positioned(
              child: Center(
            child: Text(
              _msg,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal),
            ),
          )),
    );

    overlayState.insert(_overlayEntry);

    //等待2秒
    await Future.delayed(Duration(seconds: 2));
    //移除
    remove();
  }

  static void remove() {
    if (_overlayEntry == null) {
      return;
    }
    _overlayEntry.remove();
  }
}
