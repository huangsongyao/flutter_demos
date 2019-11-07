import 'package:flutter/material.dart';
import 'package:flutter_app_study/TabBarWidget/HomeWidget/banner/custom_banner_widget.dart';

class _CustomPageWidget extends StatelessWidget {
  final String title;

  _CustomPageWidget({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(this.title),
      ),
    );
  }
}

class MacWidget extends StatefulWidget {
  final String title;

  MacWidget(this.title);

  @override
  _MacWidget createState() => _MacWidget(title);
}

class _MacWidget extends State<MacWidget> {
  final String title;
  double _currentPage = 0.0;
  final PageController _pageController = new PageController();
  final List<_CustomPageWidget> lists = List();

  _MacWidget(this.title);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lists
      ..add(_CustomPageWidget(title: "0"))
      ..add(_CustomPageWidget(title: "1"))
      ..add(_CustomPageWidget(title: "2"))
      ..add(_CustomPageWidget(title: "3"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: _TitleViewWidget(),
        backgroundColor: Colors.blue,
      ),
//      body: FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
//
//      }),
      body: CustomBannerWidget(images: [
        "http://img5.mtime.cn/mg/2019/03/18/151856.28077999.jpg",
        "http://img5.mtime.cn/mg/2019/03/18/151422.18461058.jpg",
        "http://img5.mtime.cn/mg/2019/03/18/142331.11974783.jpg",
        "http://img5.mtime.cn/mg/2019/03/18/081735.69709742.jpg"
      ]),
    );
  }
}

class _TitleViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 40.0,
                height: 40.0,
                margin: EdgeInsets.all(15.0),
                child: GestureDetector(
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/2.0x/AppIcon40x40.png",
                      image:
                          "http://img5.mtime.cn/mg/2019/01/25/100903.64806042_170X256X4.jpg"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
