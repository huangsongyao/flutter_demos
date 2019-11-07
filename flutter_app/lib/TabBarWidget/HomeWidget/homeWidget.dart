import 'package:flutter/material.dart';
import 'package:flutter_app_study/app_icon.dart';
import 'package:flutter_app_study/Networking/http_networking_manager.dart';
import 'package:flutter_app_study/Networking/homepage_map_json_model.dart';

//import 'package:';
enum MenuItems {
  messages,
  addFirends,
  scaning,
  pay,
}

enum MessageListItem {
  firend,
  group,
  publiChannel,
  subscribeChannel,
}

class HomeWidget extends StatefulWidget {
  final String title;

  HomeWidget(this.title);

  @override
  _HomeWidget createState() => _HomeWidget(title);
}

class _HomeWidget extends State<HomeWidget> {
  final String title;

  _HomeWidget(this.title);

  final List<Map<Icon, Map<String, MenuItems>>> _menus = List();
  List<CustomListItem> _dataSource = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _menus
      ..add({
        Icon(Icons.message, color: Colors.white): {"群聊": MenuItems.messages}
      })
      ..add({
        Icon(Icons.group_add, color: Colors.white): {
          "添加朋友": MenuItems.addFirends
        }
      })
      ..add({
        Icon(Icons.linked_camera, color: Colors.white): {
          "扫一扫": MenuItems.scaning
        }
      })
      ..add({
        Icon(Icons.payment, color: Colors.white): {"您的支付": MenuItems.pay}
      });


    NetworkingManager.instance.getHttp("api-app/homepage/homepageDetail", {"corpNo": "33", "idcardNo": "410482197603264529"}, (NetworkingResponse response) {
    print("1111111111111111111");
    HomepageModel homepageModel = HomepageModel.fromJson(response.toResult());
    print(homepageModel.data.modules.first.image);
    _dataSource = homepageModel.data.modules.map((HomepageDataModulesModel moduleModel) {
      print(moduleModel.hasRedCount());
      return CustomListItem(avater: moduleModel.image, title: moduleModel.name, content: moduleModel.name, times: moduleModel.createTime, muted: true);
    }).toList();
      setState(() {});
    }, (NetworkingResponse failure) {
      print("${failure.toErrorString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(this.title),
        backgroundColor: Colors.blue,
//        actions: <Widget>[
//          PopupMenuButton(
//            itemBuilder: (BuildContext context) {
//              return this._menus.map((Map<Icon, Map<String, MenuItems>> map) {
//                return PopupMenuItem(
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Container(
//                        child: map.keys.first,
//                        padding: EdgeInsets.only(right: 15.0),
//                      ),
//                      Text(
//                        map.values.first.keys.first,
//                        style: TextStyle(color: Colors.white),
//                      ),
//                    ],
//                  ),
//                  value: map.values.first.values.first,
//                );
//              }).toList();
//            },
//            onSelected: (MenuItems item) {
//              print(item);
//            },
//            icon: Icon(Icons.add, color: Colors.white),
//          ),
//        ],
      ),
      body: Center(
        child: Container(
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            print(index);
            if (this._dataSource.length > 0) {
              return MessageListViewItem(item: this._dataSource[index]);
            }
            return Container();
          },
          itemCount: this._dataSource.length,
        )),
      ),
    );
  }
}

class CustomListItem {
  final String avater;
  final String title;
  final String content;
  final String times;
  final bool muted;
  final MessageListItem type;

  CustomListItem(
      {Key key,
      @required String avater,
      @required String title,
      @required String content,
      @required String times,
      @required bool muted,
      MessageListItem type})
      : this.avater = avater,
        this.title = title,
        this.content = content,
        this.times = times,
        this.muted = muted,
        this.type = type;

  Widget _listViewOfAvaterIcon() {
    Map<MessageListItem, Image> avaterMap = {
      MessageListItem.publiChannel: Image.asset("assets/2.0x/AppIcon40x40.png",
          fit: BoxFit.cover, height: 40.0, width: 40.0),
      MessageListItem.subscribeChannel: Image.asset("assets/2.0x/tag_tel.png",
          fit: BoxFit.cover, height: 40.0, width: 40.0)
    };
    Widget image = avaterMap[this.type];
    if (image == null) {
      image = FadeInImage.assetNetwork(
          placeholder: "assets/2.0x/AppIcon40x40.png",
          image: this.avater,
          fit: BoxFit.cover,
          height: 40.0,
          width: 40.0);
    }
    return image;
  }
}

class MessageListViewItem extends StatelessWidget {
  final CustomListItem item;

  MessageListViewItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.6),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                ClipRRect(
                  child: this.item._listViewOfAvaterIcon(),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                //Positioned是个绝对布局的容器控件
                Positioned(
                  child: UnreadNotifyDotWidget(notifitys: "18"),
                  right: -AppContainer.AppContainerNotifyDotHeight / 2.0,
                  top: -AppContainer.AppContainerNotifyDotHeight / 2.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  this.item.title,
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  this.item.content,
                  style: TextStyle(color: Colors.grey, fontSize: 13.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15.0, left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text((this.item.times != null ? this.item.times : ""),
                      style: TextStyle(color: Colors.black, fontSize: 10.0)),
                ),
                Container(
                  child: Icon(Icons.volume_off, color: Colors.grey, size: 20.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UnreadNotifyDotWidget extends StatelessWidget {
  final String notifitys;

  UnreadNotifyDotWidget({Key key, @required this.notifitys}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      height: AppContainer.AppContainerNotifyDotHeight,
      width: AppContainer.AppContainerNotifyDotHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            AppContainer.AppContainerNotifyDotHeight / 2.0),
        color: AppColors.AppNotifyDotColorWidget,
      ),
      child: Text(
        this.notifitys,
        style: TextStyle(color: Colors.white, fontSize: 11.0),
      ),
    );
  }
}
