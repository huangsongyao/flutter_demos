import 'package:flutter/material.dart';
import 'package:flutter_app_study/app_icon.dart';
import 'package:flutter_app_study/TabBarWidget/HomeWidget/homeWidget.dart';
import 'package:flutter_app_study/TabBarWidget/WalletWidget/walletWidget.dart';
import 'package:flutter_app_study/TabBarWidget/MacWidget/macWidget.dart';
import 'package:flutter_app_study/TabBarWidget/AccountWidget/accountWidget.dart';

class XQCTabBarConfig {
  final TextStyle normalTextStyle =
      TextStyle(fontSize: 10.0);
  final TextStyle selectedTextStyle =
      TextStyle(fontSize: 10.0);
  String title;
  IconData iconByNormal;
  IconData iconBySelected;
  Widget tabBarItemWidget;

  XQCTabBarConfig.init(this.title, this.iconByNormal, this.iconBySelected, this.tabBarItemWidget);
  
  static List<XQCTabBarConfig> tabBarConfigs() {
    String weixin = "微信";
    String tongxunlu = "通讯录";
    String faxian = "发现";
    String wo = "我";
    List<Map<String, Object>> paramters = [
      {
        "title": weixin,
        "iconByNormal":
            IconData(0xe61c, fontFamily: AppIconContants.AppIconFontsFamily),
        "iconBySelected":
            IconData(0xe61d, fontFamily: AppIconContants.AppIconFontsFamily),
        "tabBarItemWidget": HomeWidget(weixin)
      },
      {
        "title": tongxunlu,
        "iconByNormal":
            IconData(0xe53e, fontFamily: AppIconContants.AppIconFontsFamily),
        "iconBySelected":
            IconData(0xe53d, fontFamily: AppIconContants.AppIconFontsFamily),
        "tabBarItemWidget": WalletWidget(tongxunlu)
      },
      {
        "title": faxian,
        "iconByNormal":
            IconData(0xe67f, fontFamily: AppIconContants.AppIconFontsFamily),
        "iconBySelected":
            IconData(0xe68f, fontFamily: AppIconContants.AppIconFontsFamily),
        "tabBarItemWidget": MacWidget(faxian)
      },
      {
        "title": wo,
        "iconByNormal":
            IconData(0xe605, fontFamily: AppIconContants.AppIconFontsFamily),
        "iconBySelected":
            IconData(0xe62a, fontFamily: AppIconContants.AppIconFontsFamily),
        "tabBarItemWidget": AccountsWidget(wo)
      },
    ];
    List<XQCTabBarConfig> configs = List();
    paramters.forEach((Map<String, Object> map)=> {
      configs..add(new XQCTabBarConfig.init(map["title"], map["iconByNormal"], map["iconBySelected"], map["tabBarItemWidget"]))
    });
    print(configs);
    return configs;
  }

}

