import 'package:flutter/material.dart';
import 'package:flutter_ge/widget/page/expertjz/ExpertJZListPage.dart';
import 'package:flutter_ge/widget/page/information//InformationListPage.dart';

///Copyright , 2015-2019, 健康无忧网络科技有限公司 <br>
///Author: 陈刘磊 1070379530@qq.com <br>
///Date: 2019/5/10 16:44    <br>
///Description: 注册路由   <br>
class Routes {
  static final String NAME_ExpertJZListPage = "ExpertJZListPage";
  static final String NAME_InformationListPage = "InformationListPage";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      NAME_ExpertJZListPage: (context) => ExpertJZListPage(),
      NAME_InformationListPage: (context) => InformationListPage(),
    };
  }
}
