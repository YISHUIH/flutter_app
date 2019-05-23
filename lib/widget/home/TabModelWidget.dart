import 'package:flutter/material.dart';

///Copyright , 2015-2019, 健康无忧网络科技有限公司 <br>
///Author: 陈刘磊 1070379530@qq.com <br>
///Date: 2019/5/9 13:47    <br>
///Description: 首页的功能入口  <br>

class TabModelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    SizedBox.fromSize(child: Image.asset(
                      'images/3.0x/icon_project_courseware.png',
                      fit: BoxFit.fill,
                    ),size: Size(48, 48),),
                    Text("BT ONE")
                  ],
                ),
                onTap: () {},
              ),
              flex: 1,
            ),
            Expanded(
              child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/3.0x/icon_experts_regular.png',
                      scale: 3.0,
                    ),
                    Text("BT TWO")
                  ],
                ),
                onTap: () {},
              ),
              flex: 1,
            ),
            Expanded(
              child: GestureDetector(
                child: Column(
                  children: <Widget>[Image.asset(
                    'images/3.0x/icon_consultation_regular.png',
                    scale: 3.0,
                  ), Text("BT THREE")],
                ),
                onTap: () {},
              ),
              flex: 1,
            ),
            Expanded(
              child: GestureDetector(
                child: Column(
                  children: <Widget>[Image.asset(
                    'images/3.0x/icon_referral_regular.png',
                    scale: 3.0,
                  ), Text("BT FOUR")],
                ),
                onTap: () {},
              ),
              flex: 1,
            ),
          ],
        ));
  }
}
