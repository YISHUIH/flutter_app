import 'package:flutter/material.dart';

import '../mine/MineWidget.dart';

///Copyright , 2015-2019,  <br>
///Author:  1070379530@qq.com <br>
///Date: 2019/5/24 10:48    <br>
///Description: 默认的Footer  <br>

class DefaultFooter extends StatefulWidget {

  DefaultFooter({@required this.mode,}) ;


  final RefreshIndicatorMode mode;


  @override
  _DefaultFooterState createState() => _DefaultFooterState();
}

class _DefaultFooterState extends State<DefaultFooter> with PointMode {
  String message = "上拉加载更多";

  @override
  Widget build(BuildContext context) {
    onMove();
    return Container(
      child: Text(message),
    );
  }

  @override
  void onMove() {
    setState(() {
      message = "上拉加载更多";
    });
  }

  @override
  void onOverFlow() {
    setState(() {
      message = "释放加载";
    });
  }

  @override
  void onWork() {
    message = "刷新中";
  }
}
