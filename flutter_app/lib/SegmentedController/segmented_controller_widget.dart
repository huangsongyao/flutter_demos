import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_app_study/TabBarWidget/HomeWidget/homeWidget.dart';
import 'package:flutter_app_study/TabBarWidget/WalletWidget/walletWidget.dart';
import 'package:flutter_app_study/TabBarWidget/MacWidget/macWidget.dart';
import 'package:flutter_app_study/TabBarWidget/AccountWidget/accountWidget.dart';
import 'package:flutter_app_study/SegmentedController/SubSegmentedController/segmented_home_controller_widget.dart';

class CustomSegmentedController extends StatefulWidget {
  @override
  _CustomSegmentedControllerState createState() =>
      _CustomSegmentedControllerState();
}

class _CustomSegmentedControllerState extends State<CustomSegmentedController> {
  final List<Map<int, String>> titles = [{0: "直播"}, {1: "推荐"}, {2: "热门"}, {3: "追番"}];

  List<Widget> widgets = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widgets
      ..add(HomeSegmentedController())//HomeWidget("直播")
      ..add(WalletWidget("推荐"))
      ..add(MacWidget("热门"))
      ..add(AccountsWidget("追番"));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: titles.length,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlueAccent,
              elevation: 0.0,
              title: Text("home"),
//            title: TabBar(
//              tabs: titles.map((String str) {
//                return Text(str);
//              }).toList(),
//              isScrollable: true,
//              unselectedLabelColor: Colors.black,
//              labelColor: Colors.yellow,
//              indicatorSize: TabBarIndicatorSize.label,
//              indicatorWeight: 4.0,
//              indicatorColor: Colors.yellow,
//
//            ),
            ),
            body: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: Colors.grey.shade600, width: 0.8),
                  )),
                  child: Container(
                    height: 50.0,
                    child: TabBar(
                      tabs: titles.map((Map<int, String> map) {
                        return Container(child: Text(map.values.first, style: TextStyle()));
                      }).toList(),
                      isScrollable: true,
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.yellow,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 4.0,
                      indicatorColor: Colors.yellow,
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  children: titles.map((Map<int, String> map) {
                    return Scaffold(
                      body: this.widgets[map.keys.first],
                    );
                  }).toList(),
                )),
              ],
            )));
  }
}
