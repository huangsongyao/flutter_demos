import 'package:flutter/material.dart';

class ListWidgetController extends StatelessWidget {
  final List<String> datas = [
    "http://img5.mtime.cn/mg/2019/01/25/100903.64806042_170X256X4.jpg",
    "http://img5.mtime.cn/mg/2019/02/22/093825.30100827_126X190X4.jpg",
    "http://img5.mtime.cn/mg/2019/02/22/094721.18495179_126X190X4.jpg",
    "http://img5.mtime.cn/mg/2019/02/19/095714.33859824_126X190X4.jpg",
    "http://img5.mtime.cn/mg/2019/02/28/110106.21944992_126X190X4.jpg",
    "http://img5.mtime.cn/mg/2019/03/06/163902.37059065.jpg",
    "http://img5.mtime.cn/mg/2019/03/06/103628.13654338.jpg",
    "http://img5.mtime.cn/mg/2019/03/06/082259.33243442.jpg",
    "http://img5.mtime.cn/mg/2019/01/24/141147.52006013.jpg",
    "http://img5.mtime.cn/mg/2019/03/06/103206.87572172.jpg",
    "http://img5.mtime.cn/mg/2019/02/25/155624.60310312.jpg",
    "http://img5.mtime.cn/mg/2019/02/13/171555.63396114.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("listView widget viewController"),
        backgroundColor: Colors.blue,
      ),
//      Card(
//        child: new Column(
//          children: <Widget>[
//            ListTile(
//              leading: Icon(Icons.account_balance, color: Colors.blue,),
//              title: new Text("广东省深圳市福田区上沙龙秋村4巷28号"),
//              subtitle: new Text("黄先生:15914267795"),
//            ),
//          ],
//        ),
//      ),
      body: new MyGrid(urlStrings: datas),
    );
  }
}

class MyList extends StatelessWidget {
  final List<String> dataSource;

  MyList({
    Key key,
    @required this.dataSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: this.dataSource.length,
      itemBuilder: (content, index) {
        return new ListTile(
          title: new Container(
            color: Color.fromARGB(255, 100, 234, index),
            child: new Text("${this.dataSource[index]}"),
          ),
        );
      },
    );
  }
}

class MyGrid extends StatelessWidget {
  final List<String> urlStrings;

  MyGrid({Key key, @required this.urlStrings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.all(2.0),
      child: new GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.7,
          ),
          itemCount: this.urlStrings.length,
          itemBuilder: (context, index) {
//          var stack = new Stack(
//            alignment: const FractionalOffset(0.5, 0.8),
//            children: <Widget>[
//              CircleAvatar(
//                backgroundImage: NetworkImage("${this.urlStrings[index]}"),
//              ),
//              Container(
//                child: new Text("我的英雄学院：两位英雄"),
//              ),
//            ],
//          );
//          return stack;

            return __onPressedItem(context, index);
          }),
    );
  }

  Widget __onPressedItem(BuildContext context, int index) {
    var movieImage =
        new Image.network("${this.urlStrings[index]}", fit: BoxFit.cover);
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, movieImage); //movieImage
      },
      child: movieImage,
    );
  }


}

class JSONBeanForProduct {
  final String title;
  final List<String> imgs;

  JSONBeanForProduct(this.title, this.imgs);
}
