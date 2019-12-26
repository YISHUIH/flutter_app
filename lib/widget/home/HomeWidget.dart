/**
 * Copyright , 2015-2019, 健康无忧网络科技有限公司 <br>
 * Author: 陈刘磊 1070379530@qq.com <br>
 * Date: 2019/4/29 16:03    <br>
 * Description: 首页  <br>
 */

import 'package:flutter/material.dart';
import 'package:flutter_ge/mode/Banner.dart';
import 'package:flutter_ge/res/color.dart';
import 'package:flutter_ge/res/routes.dart';
import 'package:flutter_ge/widget/home/BannerWidget.dart';
import 'package:flutter_ge/widget/home/TipWidget.dart';
import 'package:flutter_ge/widget/listwidget/ExpertJZListWidget.dart';
import 'package:flutter_ge/widget/listwidget/InformationListWidget.dart';

import '../test.dart';
import 'TabModelWidget.dart';

///Copyright , 2015-2019,  <br>
///Author:  1070379530@qq.com <br>
///Date: 2019/4/29 16:03    <br>
///Description: 首页  <br>

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<BannerInfo> _list = List();

  @override
  void initState() {
    // TODO: implement initState
    BannerInfo.dataRequest().then((list) {
      setState(() {
        _list = list;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RefreshIndicatorTest(
            child: ListView(
              children: <Widget>[
                _getTitle(),
                _getSearch(),
                BannerWidget(_list),
                TipWidget(_list),
                TabModelWidget(),
                _getExpertJZList(),
                ExpertJZListWidget(
                  _getBannerListFor2(),
                  physics: NeverScrollableScrollPhysics(),
                ),
                _getInformationList(),
                InformationListWidget(
                  _getBannerListFor3(),
                  physics: NeverScrollableScrollPhysics(),
                )
              ],
            ),
            onRefresh: () {
              print("ssssss");
            }));
  }

  ///标题部分
  Widget _getTitle() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
      child: Text(
        "Flutter APP",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  ///搜索框部分
  Widget _getSearch() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(16, 9, 16, 9),
        color: colors.them_bg_gray,
        elevation: 0,
        onPressed: () {},
        child: Row(children: <Widget>[
          Icon(
            Icons.search,
            color: colors.them_text_gray,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              "Search",
              style: TextStyle(color: colors.them_text_gray, fontSize: 14),
            ),
          )
        ]),
      ),
    );
  }

  ///专家讲座列表
  Widget _getExpertJZList() {
    return FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.NAME_ExpertJZListPage);
      },
      child: Row(
        children: <Widget>[
          Text(
            "GRID MORE",
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }

  ///医学资讯列表
  Widget _getInformationList() {
    return FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.NAME_InformationListPage);
      },
      child: Row(
        children: <Widget>[
          Text(
            "LIST MORE",
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }

  ///获取两个数据
  List<BannerInfo> _getBannerListFor2() {
    if (_list.length < 2) {
      return _list;
    }
    return _list.sublist(0, 2);
  }

  ///获取三个数据
  List<BannerInfo> _getBannerListFor3() {
    if (_list.length < 3) {
      return _list;
    }
    return _list.sublist(0, 3);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
