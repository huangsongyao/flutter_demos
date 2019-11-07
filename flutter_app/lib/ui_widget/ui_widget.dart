import 'package:flutter/material.dart';
import 'package:flutter_app_study/app_icon.dart';

class UiWidget extends StatefulWidget {
  UiWidget({Key key}) : super(key: key);

  @override
  _UiWidgetState createState() => _UiWidgetState();
}

class _UiWidgetState extends State<UiWidget> {
  @override
  Widget build(BuildContext context) {
//    return ContainerWidget();
//    return PageViewWidget();
    return SliverGridWidget();
  }
}

//容器ui demo
class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppStaticMethods.boxContainer(Size(100.0, 100.0),
              Icon(Icons.add_a_photo), Colors.cyanAccent, 20.0),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              gradient: AppStaticMethods.gradientColors([
                Colors.cyanAccent,
                Colors.cyan,
              ]),
            ),
          ),
          AppStaticMethods.containerBox(
            Size(100, 100),
            Container(
              child: Text(
                  "我有很多很多文字怎么办？是否会自动换行，还是会被分开截取？毕竟我使用了限制盒子这个widget来限制了最大的宽高，防止太多的内容自动撑开容器。"),
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }
}

//分页ui demo
class PageViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        reverse: true,
        children: <Widget>[
          Container(
            child: Center(
              child: Text("ONE"),
            ),
            color: Colors.greenAccent,
          ),
          Container(
            child: Center(
              child: Text("TWO"),
            ),
            color: Colors.amberAccent,
          ),
          Container(
            child: Center(
              child: Text("THREE"),
            ),
            color: Colors.cyanAccent,
          ),
        ],
      ),
    );
  }
}

//网格ui demo
class SliverGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("sliver-grid"),
          ),
          SliverSafeArea(//顶部和底部的安全区域，如果没有SliverAppBar的情况下可以使用
            sliver: SliverPadding(//上下左右四边距
              padding: EdgeInsets.all(8.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      child: Image.network(
                        "http://img5.mtime.cn/mg/2019/03/20/181731.11572032.jpg",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  childCount: 30, //网格个数，如果不设置默认就是无限多个
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, //主轴的item数目
                  mainAxisSpacing: 8.0, //主轴间距
                  crossAxisSpacing: 8.0, //纵轴间距
                  childAspectRatio: 0.8, //宽高比，用于计算每个网格的size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
