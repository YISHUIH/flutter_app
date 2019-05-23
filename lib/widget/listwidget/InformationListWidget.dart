import 'package:flutter/material.dart';
import 'package:flutter_ge/mode/Banner.dart';
import 'package:flutter_ge/widget/page/information/InformationDetailPage.dart';

///Copyright , 2015-2019, 健康无忧网络科技有限公司 <br>
///Author: 陈刘磊 1070379530@qq.com <br>
///Date: 2019/5/20 9:26    <br>
///Description: 医学资讯列表   <br>
class InformationListWidget extends StatelessWidget {
  List<BannerInfo> _list;
  ScrollPhysics physics;

  InformationListWidget(this._list, {ScrollPhysics physics}) {
    this.physics = physics == null ? AlwaysScrollableScrollPhysics() : physics;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _list.length,
      itemBuilder: _getItem,
      physics: physics,
    );
  }

  Widget _getItem(BuildContext context, int index) {
    var info = _list[index];
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Image.network(info.imageUrl),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(info.title),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    info.author,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              flex: 1,
            )
          ],
        ),
        Positioned.fill(
            child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white.withOpacity(0.3),
            highlightColor: Colors.white.withOpacity(0.2),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InformationDetailPage(
                        bannerInfo: info,
                      )));
            },
          ),
        ))
      ],
    );
  }
}
