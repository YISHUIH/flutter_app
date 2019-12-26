import 'package:flutter/material.dart';
import 'package:flutter_ge/mode/Banner.dart';

///Copyright , 2015-2019,  <br>
///Author:  1070379530@qq.com <br>
///Date: 2019/5/10 17:12    <br>
///Description: 专家列表详情   <br>

class ExpertJZDetailPage extends StatelessWidget {
  final BannerInfo bannerInfo;

  ExpertJZDetailPage({
    @required this.bannerInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bannerInfo.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Image.network(bannerInfo.imageUrl),
        ],
      ),
    );
  }
}
