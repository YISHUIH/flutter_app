import 'package:flutter/material.dart';
import 'package:flutter_ge/mode/Banner.dart';
import 'package:flutter_ge/widget/listwidget/ExpertJZListWidget.dart';
///Copyright , 2015-2019,  <br>
///Author:  1070379530@qq.com <br>
///Date: 2019/5/10 16:21    <br>
///Description: 专家讲座列表   <br>
class ExpertJZListPage extends StatefulWidget {
  @override
  _ExpertJZListPageState createState() => _ExpertJZListPageState();
}

class _ExpertJZListPageState extends State<ExpertJZListPage> {
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
    return Scaffold(appBar: AppBar(title: Text("专家列表"),elevation: 0.0,),body: ExpertJZListWidget(_list),);
  }
}

