import 'package:flutter/material.dart';
import 'package:flutter_app_study/TabBarWidget/WalletWidget/walletWidget.dart';
import 'package:flutter_app_study/TabBarWidget/AccountWidget/accountWidget.dart';
import 'package:flutter_app_study/TabBarWidget/HomeWidget/homeWidget.dart';
import 'package:flutter_app_study/TabBarWidget/MacWidget/macWidget.dart';
import 'package:flutter_app_study/app_icon.dart';
import 'package:flutter_app_study/TabBarWidget/tabBar_config.dart';
import 'package:flutter_app_study/Networking/http_networking_manager.dart';


class TabBarWidget extends StatefulWidget {
  _TabBarWidget createState() => _TabBarWidget();
}

class _TabBarWidget extends State<TabBarWidget> {
  var _BottomNavigationBarColor = Color(AppColors.AppTabIconTabBackgroundColor);
  int _currentIndex = 0;
  List<NavigationIconView> widgets = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    String weixin = "微信";
//    String tongxunlu = "通讯录";
//    String faxian = "发现";
//    String wo = "我";
//    List<Map<Map<String, Widget>, Map<Object, Object>>> paramters = [
//      {
//        {weixin: HomeWidget(weixin)}: {
//          IconData(0xe61c, fontFamily: AppIconContants.AppIconFontsFamily):
//              IconData(0xe61d, fontFamily: AppIconContants.AppIconFontsFamily)
//        },
//      },
//      {
//        {tongxunlu: WalletWidget(tongxunlu)}: {
//          IconData(0xe53e, fontFamily: AppIconContants.AppIconFontsFamily):
//              IconData(0xe53d, fontFamily: AppIconContants.AppIconFontsFamily)
//        }
//      },
//      {
//        {faxian: MacWidget(faxian)}: {
//          IconData(0xe67f, fontFamily: AppIconContants.AppIconFontsFamily):
//              IconData(0xe68f, fontFamily: AppIconContants.AppIconFontsFamily)
//        }
//      },
//      {
//        {wo: AccountsWidget(wo)}: {
//          IconData(0xe605, fontFamily: AppIconContants.AppIconFontsFamily):
//              IconData(0xe62a, fontFamily: AppIconContants.AppIconFontsFamily)
//        }
//      },
//    ];
//    widgets =
//        paramters.map((Map<Map<String, Widget>, Map<Object, Object>> map) {
//      return NavigationIconView(
//          pageWidget: map.keys.first.values.first,
//          icon: map.values.first.keys.first,
//          activeIcon: map.values.first.values.first,
//          title: Text(
//            map.keys.first.keys.first,
//          ));
//    }).toList();
    XQCTabBarConfig.tabBarConfigs().forEach((XQCTabBarConfig config)=> {
      widgets..add(NavigationIconView(pageWidget: config.tabBarItemWidget, icon: config.iconByNormal, activeIcon: config.iconBySelected, title: Text(config.title, style: config.normalTextStyle)))
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: this.widgets.map((NavigationIconView view) {
          return view._item;
        }).toList(),
        currentIndex: this._currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        fixedColor: Color(AppColors.AppTabIconActiveColor),
      ),
      body: this.widgets[this._currentIndex]._pageWidget,
    );
  }
}

class NavigationIconView {
  final Widget _pageWidget;
  final BottomNavigationBarItem _item;

  NavigationIconView(
      {Key key,
        Widget pageWidget,
        IconData icon,
        IconData activeIcon,
        Widget title})
      : _pageWidget = pageWidget,
        _item = new BottomNavigationBarItem(
            icon: Icon(icon), activeIcon: Icon(activeIcon), title: title);
}
