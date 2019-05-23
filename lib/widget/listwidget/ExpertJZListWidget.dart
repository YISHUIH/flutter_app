import 'package:flutter/material.dart';
import 'package:flutter_ge/mode/Banner.dart';
import 'package:flutter_ge/widget/page/expertjz/ExpertJZDetailPage.dart';

///Copyright , 2015-2019, 健康无忧网络科技有限公司 <br>
///Author: 陈刘磊 1070379530@qq.com <br>
///Date: 2019/5/9 16:46    <br>
///Description: 专家讲座列表   <br>
class ExpertJZListWidget extends StatelessWidget {
  List<BannerInfo> _list;
  ScrollPhysics physics;

  ExpertJZListWidget(this._list, {ScrollPhysics physics}) {
    this.physics = physics == null ? AlwaysScrollableScrollPhysics() : physics;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      //水平间隔
      crossAxisSpacing: 5.0,
      //垂直间隔
      mainAxisSpacing: 28.0,
      children: _getChildren(context),
      childAspectRatio: 1 / 1.1,
      padding: EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
      physics: physics,
    );
  }

  List<Widget> _getChildren(BuildContext context) {
    return List<Widget>.generate(_list.length, (index) {
      var _bannerInfo = _list[index];
      return Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(_bannerInfo.imageUrl),
                  Positioned(
                    child: Image.asset(
                      "images/3.0x/icon_video_play.png",
                      scale:2.0,
                    ),
                    left: 8,
                    bottom: 8,
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  _bannerInfo.description,
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _bannerInfo.author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        _bannerInfo.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned.fill(
              child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.3),
              highlightColor: Colors.white.withOpacity(0.3),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExpertJZDetailPage(
                              bannerInfo: _bannerInfo,
                            )));
              },
            ),
          ))
        ],
      );
    });
  }
}
