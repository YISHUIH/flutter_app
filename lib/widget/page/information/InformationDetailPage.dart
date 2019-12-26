import 'package:flutter/material.dart';
import 'package:flutter_ge/mode/Banner.dart';

///Copyright , 2015-2019,  <br>
///Author:  1070379530@qq.com <br>
///Date: 2019/5/10 17:12    <br>
///Description: 专家列表详情   <br>

class InformationDetailPage extends StatelessWidget {
  final BannerInfo bannerInfo;

  InformationDetailPage({
    @required this.bannerInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bannerInfo.title),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(bannerInfo.imageUrl),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(bannerInfo.title,style: TextStyle(fontSize: 18,color: Colors.black),),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(bannerInfo.author,style: TextStyle(fontSize: 14,color: Colors.grey),),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(bannerInfo.description,style: TextStyle(fontSize: 16,color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
