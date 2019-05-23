import 'package:http/http.dart' as http;
import 'dart:convert';
/**
 * Copyright , 2015-2019, 健康无忧网络科技有限公司 <br>
 * Author: 陈刘磊 1070379530@qq.com <br>
 * Date: 2019/5/7 16:53    <br>
 * Description: banner实体类   <br>
 */
class BannerInfo {
  int id;
  String title;
  String author;
  String description;
  String imageUrl;


  BannerInfo(this.id, this.title, this.author, this.description, this.imageUrl);

  BannerInfo.fromJson(Map json)
      : id = json["id"],
        title = json["title"],
        author = json["author"],
        description = json["description"],
        imageUrl = json["imageUrl"];

  static Future<List<BannerInfo>> dataRequest() async {
    var url = 'https://resources.ninghao.net/demo/posts.json';
    var response = await http.get(url);
    final responseBody = json.decode(response.body);
    List<BannerInfo> bannerList = responseBody["posts"]
        .map<BannerInfo>((item) => BannerInfo.fromJson(item))
        .toList();
    return bannerList;
  }
}