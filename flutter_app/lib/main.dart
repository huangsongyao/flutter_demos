import 'package:flutter/material.dart';
import 'package:flutter_app_study/app_icon.dart';
//import 'package:english_words/english_words.dart';
import 'package:flutter_app_study/NavigationBar/navigationBar.dart';
import 'package:flutter_app_study/TabBarWidget/tabBarWidget.dart';
import 'package:http/http.dart';
import 'package:flutter_app_study/animation_widget/animation_widget.dart';
import 'package:flutter_app_study/SegmentedController/segmented_controller_widget.dart';
import 'package:flutter_app_study/xqc_tabBar_items_widget/xqc_user_activity.dart';
import 'package:flutter_app_study/xqc_tabBar_items_widget/xqc_video_player_activity.dart';
import 'package:flutter_app_study/flhsy_video_player/video_player_tools.dart';
import 'package:flutter_app_study/ui_widget/ui_widget.dart';
import 'package:flutter_app_study/RxDart/rxdart_widget.dart';
import 'package:flutter_app_study/Networking/http_networking_manager.dart';

void main() => runApp(new MyApp());

class RandomWords extends StatefulWidget {
  RandomWords({Key key, this.title}) : super(key: key);
  final String title;

  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  var centerImage =
      new Image(image: new AssetImage("assets/2.0x/AppIcon40x40.png"));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved, splashColor: Colors.cyanAccent,),
        ],
        leading: Builder(builder: (BuildContext context) {
          return Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.ac_unit),
                  onPressed: () {
//                Scaffold.of(context).openDrawer();
                    Scaffold.of(context).openEndDrawer();
                  }),
            ],
          );
        }),
      ),
      body: new Container(
        child: Center(
          child: AppStaticMethods.backgroundNetworkImage("http://img5.mtime.cn/mg/2019/10/09/101213.35147833.jpg", "icon_credit_ious"),//http://img5.mtime.cn/mg/2019/10/09/101213.35147833.jpg
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                color: Colors.cyanAccent,
                child: Text("header".toUpperCase()),
              ),
              decoration: BoxDecoration(),
            ),
            Text("111111"),
            Text("111111"),
            Text("111111"),
            Text("111111"),
            Text("111111"),
            Text("111111"),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: <Widget>[
            Text("111111"),
            Text("111111"),
            Text("111111"),
            Text("111111"),
            Text("111111"),
            Text("111111"),
          ],
        ),
      ),
    );
  }

  void __updateImage(Image image) {
    setState(() {
      centerImage = image;
    });
  }

  void _pushSaved() {
    Navigator.push<Widget>(context,
        new MaterialPageRoute(builder: (BuildContext context) {
//        return new ListWidgetController();
      return new TabBarWidget();
//      return new CustomSegmentedController();
//    return xqc_user_activity();
//    return Video_player_tools("https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4");
//        return UiWidget();
//        return RxdartWidget();
    })).then((Widget result) {
      setState(() {
        __updateImage(result);
      });
    });

//    Navigator.of(context).push(CustomRoute(widget: TabBarWidget()));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NetworkingManager.instance.configRequestHeaders(ServerAddressModel.debugType, null);
    return new MaterialApp(
        title: 'Startup Name Generator',
        theme: new ThemeData(
          splashColor: AppColors.AppClearColor,
          highlightColor: AppColors.AppClearColor,
        ),
        //隐藏导航栏右上角的debug的logo图标
        debugShowCheckedModeBanner: false,
        home: new RandomWords());
  }
}
