import 'package:flutter/material.dart';
import 'package:flutter_app_study/app_icon.dart';

const int kCrossAxisCount = 4;

enum UserAccountState {
  consumer,
  members,
  vip,
}

//头部model
class Xqc_user_header_model {
  String userHeaderPictureUrl;
  String userNickName;
  String userIntro;
  UserAccountState accountState;

  Xqc_user_header_model(
      @required this.userHeaderPictureUrl,
      @required this.userNickName,
      @required this.userIntro,
      @required this.accountState);

  String getUserAccountStateImageName() {
    String name = {
      UserAccountState.consumer: "icon_credit_ trip",
      UserAccountState.members: "icon_credit_dining",
      UserAccountState.vip: "icon_credit_life",
    }[this.accountState];
    return name;
  }

  static Xqc_user_header_model defaultHeaderModel() {
    Xqc_user_header_model defaultModel = Xqc_user_header_model(
        "http://img5.mtime.cn/mg/2019/03/20/181731.11572032.jpg",
        "嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿",
        "简介：眼睛等色诱，有人性，镜头里总有丰收",
        UserAccountState.members);
    return defaultModel;
  }
}

class xqc_user_header_widget extends StatefulWidget {
  @override
  Xqc_user_header_model userHeaderModel;

  xqc_user_header_widget(@required this.userHeaderModel);

  _xqc_user_header_widgetState createState() =>
      _xqc_user_header_widgetState(this.userHeaderModel);
}

class _xqc_user_header_widgetState extends State<xqc_user_header_widget> {
  final Xqc_user_header_model userHeaderModel;

  _xqc_user_header_widgetState(@required this.userHeaderModel);

  @override
  Widget build(BuildContext context) {
    double heights = 120.0;
    double imageOffset = 20.0;
    return Container(
      color: Colors.white,
      child: Container(
        height: heights,
        width: AppScreen.AppScreenContextWidths(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //设置row组件的子组件在视图中纵轴方向的位置为剧中
          mainAxisAlignment: MainAxisAlignment.start,
          //设置row组件的子组件在视图中横轴方向的位置为左对齐
          children: <Widget>[
            Container(
              width: (heights - imageOffset - imageOffset),
              height: (heights - imageOffset - imageOffset),
              margin: EdgeInsets.only(left: imageOffset),
              child: AppStaticMethods.clipOvalNetImage(
                  this.userHeaderModel.userHeaderPictureUrl),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: imageOffset, right: imageOffset),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.userHeaderModel.userNickName,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      this.userHeaderModel.userIntro,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: imageOffset / 2.0),
              child: Row(
                children: <Widget>[
                  Image.asset(
                      "assets/${this.userHeaderModel.getUserAccountStateImageName()}.png"),
                  Text(
                    "会员",
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 11),
                  ),
                  Image.asset(AppImages.AppAssetImages("img_allow")),
                ],
              ),
            ),
          ],
        ),
        decoration: AppStaticMethods.blackLine(),
      ),
    );
  }
}

//微博+关注+粉丝的model
class Xqc_user_info_model {
  String leftOfNumber;
  String leftOfContent;

  String centryOfNumber;
  String centryOfContent;

  String rightOfNumber;
  String rightOfContent;

  Xqc_user_info_model(
      this.leftOfNumber,
      this.leftOfContent,
      this.centryOfNumber,
      this.centryOfContent,
      this.rightOfNumber,
      this.rightOfContent);

  static Xqc_user_info_model defuaultUserInfoModel() {
    return Xqc_user_info_model("400", "微博", "118", "关注", "182", "粉丝");
  }
}

class xqc_user_bottom_header_widget extends StatefulWidget {
  Xqc_user_info_model userInfoModel;

  xqc_user_bottom_header_widget(@required this.userInfoModel);

  @override
  _xqc_user_bottom_header_widgetState createState() =>
      _xqc_user_bottom_header_widgetState(this.userInfoModel);
}

class _xqc_user_bottom_header_widgetState
    extends State<xqc_user_bottom_header_widget> {
  Xqc_user_info_model userInfoModel;

  _xqc_user_bottom_header_widgetState(@required this.userInfoModel);

  @override
  Widget build(BuildContext context) {
    double columnOffset = 5.0;
    double columnOfWidth = AppScreen.AppScreenContextWidths(context) / 3;
    return Container(
      height: 80.0,
      width: AppScreen.AppScreenContextWidths(context),
      color: Colors.white,
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _columnChileContainer(context, this.userInfoModel.leftOfNumber,
              this.userInfoModel.leftOfContent),
          _columnChileContainer(context, this.userInfoModel.centryOfNumber,
              this.userInfoModel.centryOfContent),
          _columnChileContainer(context, this.userInfoModel.rightOfNumber,
              this.userInfoModel.rightOfContent),
        ],
      ),
    );
  }

  Text _numberTextWidget(String numberString) {
    return Text("${numberString}",
        style: TextStyle(color: Colors.grey, fontSize: 16));
  }

  Text _contentTextWidget(String contentString) {
    return Text("${contentString}",
        style: TextStyle(color: Colors.black, fontSize: 15));
  }

  Container _columnChileContainer(
      BuildContext context, String numberString, String contentString) {
    double columnOffset = 5.0;
    double columnOfWidth = AppScreen.AppScreenContextWidths(context) / 3;

    return Container(
      width: columnOfWidth,
      child: Column(
        children: <Widget>[
          _numberTextWidget(numberString),
          Container(
            height: columnOffset,
          ),
          _contentTextWidget(contentString),
        ],
      ),
    );
  }
}

//多选项的model
class Xqc_modules_model {
  List<Map<String, String>> modules = [
    {"我的相册": "icon_home_evection"},
    {"我的故事": "icon_home_lease"},
    {"我的赞": "icon_home_recharge"},
    {"粉丝服务": "icon_home_remuneration"},
    {"微博钱包": "icon_home_salary_sign"},
    {"微博优选": "icon_home_search"},
    {"粉丝头条": "icon_home_store"},
    {"客服中心": "icon_home_more"},
  ];

  Xqc_modules_model();

  List<_xqc_user_modules_element_widget> gridItemBuiders() {
    List<_xqc_user_modules_element_widget> itemBuiders = List();
    modules.map((Map<String, String> map) {
      itemBuiders.add(
          _xqc_user_modules_element_widget(map.values.first, map.keys.first));
    }).toList();
    print(itemBuiders);
    return itemBuiders;
  }

  static double getWidths(BuildContext context) {
    double widths = AppScreen.AppScreenContextWidths(context) / kCrossAxisCount;
    return widths;
  }

  int itemLines(BuildContext context) {
    double widths = Xqc_modules_model.getWidths(context);
    int lines = (this.modules.length / kCrossAxisCount).toInt();
    return lines;
  }
}

class _xqc_user_modules_element_widget extends StatelessWidget {
  String asset;
  String title;

  _xqc_user_modules_element_widget(@required this.asset, @required this.title);

  @override
  Widget build(BuildContext context) {
    double widths = Xqc_modules_model.getWidths(context);
    return Container(
      height: widths,
      width: widths,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(AppImages.AppAssetImages(this.asset)),
          Container(
            height: 5.0,
          ),
          Text(
            this.title,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class xqc_user_modules_widget extends StatefulWidget {
  Xqc_modules_model modulesModel;

  xqc_user_modules_widget(@required this.modulesModel);

  @override
  _xqc_user_modules_widgetState createState() =>
      _xqc_user_modules_widgetState(this.modulesModel);
}

class _xqc_user_modules_widgetState extends State<xqc_user_modules_widget> {
  Xqc_modules_model modulesModel;

  _xqc_user_modules_widgetState(@required this.modulesModel);

  @override
  Widget build(BuildContext context) {
    List<_xqc_user_modules_element_widget> gridItemBuiders =
        this.modulesModel.gridItemBuiders();
    return Container(
      width: Xqc_modules_model.getWidths(context),
      height: (Xqc_modules_model.getWidths(context) *
          this.modulesModel.itemLines(context)),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: kCrossAxisCount,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return gridItemBuiders[index];
        },
        itemCount: gridItemBuiders.length,
        physics: NeverScrollableScrollPhysics(),
      ), //shrinkWrap: true,
    );
  }
}

//签到的model
class Xqc_sign_model {
  final String leftTitle = "签到领红包";
  final String mainTitle = "连续签到有大额奖励,断签就要重新开始哦~";
  final String signTitle = "今日待签到";
  final String taskNumberTitle = "还可完成任务";

  Xqc_sign_model();

  String assetImageName() {
    return "icon_credit_life";
  }
}

class xqc_sign_widget extends StatefulWidget {
  Xqc_sign_model signModel;

  xqc_sign_widget(@required this.signModel);

  @override
  _xqc_sign_widgetState createState() => _xqc_sign_widgetState(this.signModel);
}

class _xqc_sign_widgetState extends State<xqc_sign_widget> {
  Xqc_sign_model signModel;

  _xqc_sign_widgetState(@required this.signModel);

  @override
  Widget build(BuildContext context) {
    double titleOffset = 15.0;
    return Container(
      width: AppScreen.AppScreenContextWidths(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: titleOffset, left: titleOffset),
            child: Text(this.signModel.leftTitle,
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ),
          Container(
            margin: EdgeInsets.only(top: titleOffset, left: titleOffset),
            child: Text(this.signModel.mainTitle,
                style: TextStyle(color: Colors.black, fontSize: 16)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppStaticMethods.clipOvalAssetImage(
                      this.signModel.assetImageName(), Size(55.0, 55.0)),
                  Text(this.signModel.signTitle,
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ],
              ),
              AppStaticMethods.marginTainer(50.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("5个",
                      style: TextStyle(color: Colors.green, fontSize: 23)),
                  Text(this.signModel.taskNumberTitle,
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

//页面数据源的model
class Xqc_user_model {
  Xqc_user_header_model userHeaderModel =
      Xqc_user_header_model.defaultHeaderModel();
  Xqc_user_info_model userInfoModel =
      Xqc_user_info_model.defuaultUserInfoModel();
  Xqc_modules_model modulesModel = Xqc_modules_model();
  Xqc_sign_model signModel = Xqc_sign_model();

  Xqc_user_model();
}

class xqc_user_activity extends StatefulWidget {
  @override
  _xqc_user_activityState createState() => _xqc_user_activityState();
}

class _xqc_user_activityState extends State<xqc_user_activity> {
  Xqc_user_model dataSources = Xqc_user_model();
  List<Widget> _widgets;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgets = [
      xqc_user_header_widget(this.dataSources.userHeaderModel),
      xqc_user_bottom_header_widget(this.dataSources.userInfoModel),
      xqc_user_modules_widget(this.dataSources.modulesModel),
      xqc_sign_widget(this.dataSources.signModel),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return this._widgets[index];
          },
          itemCount: this._widgets.length,
        ),
      ),
    );
  }
}
