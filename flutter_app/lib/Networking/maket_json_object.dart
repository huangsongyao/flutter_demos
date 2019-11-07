/*
* json_annotation.dart的使用
*
* 1、在pubspec.yaml文件中添加插件库，并执行"Packages get"，将插件下载至本地，如下
#应用内所依赖的其他包或者插件
dependencies:
  flutter:
    sdk: flutter
  #build_runner是一个用于快速生成map object类方法的指令插件
  build_runner: ^1.0.0
  #json_serializable是map object类的插件库
  json_serializable: ^2.0.2

* 2、在.dart文件中import json_annotation.dart的插件库路径
* 3、在.dart文件中声明对应json的map object的类的结构，并且，所有需要被映射成map object类的模式都需要再class关键字定义类前添加：@JsonSerializable()，例如：
*
@JsonSerializable()
class MaketDataItemModel {
  String price;
  String ratio;
  String amount;
  String money;
  int max;
  int min;
  String currency;
  String usd;
  String sort;
  String type;
  String coin;
  String coinurl;

  MaketDataItemModel({this.price,
    this.ratio,
    this.amount,
    this.money,
    this.max,
    this.min,
    this.currency,
    this.usd,
    this.sort,
    this.type,
    this.coin,
    this.coinurl});
}
* 上述的类，需要声明好map object的属性，属性名称就是json的key名，如果是有被系统占用的key名，可以使用例如：@JsonKey(name: '_id')，来声明id这个key来告诉编译器属性名称需要重写
* 4、在.dart文件中，使用part关键字引入一个尚未创建的文件，文件命名为'xxxx.g.dart';，这个文件的命名规则中，xxxx表示的是.dart的名称，固定的是后面的.g.dart
* 5、在工程的根目录下或者直接在Android studio中执行[flutter packages pub run build_runner build --delete-conflicting-outputs]指令，使用指令来动态创建出'xxxx.g.dart'文件，文件内部会自行生成相关的json和object转换的方法
* 6、此时'xxxx.g.dart';文件中会有些方法报错，需要在.dart中添加方法，步骤3中的class变成如下：
@JsonSerializable()
class MaketDataItemModel {
  String price;
  String ratio;
  String amount;
  String money;
  int max;
  int min;
  String currency;
  String usd;
  String sort;
  String type;
  String coin;
  String coinurl;

  MaketDataItemModel({this.price,
    this.ratio,
    this.amount,
    this.money,
    this.max,
    this.min,
    this.currency,
    this.usd,
    this.sort,
    this.type,
    this.coin,
    this.coinurl});
  factory MaketDataItemModel.fromJson(Map<String, dynamic> json) =>
      _$MaketDataItemModelFromJson(json);
}
其中，_$MaketDataItemModelFromJson()方法是在执行了指令后在'xxxx.g.dart';文件中自动生成的
*
* */

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'maket_json_object.g.dart';

@JsonSerializable()
class MaketModel {
  int status;
  String msg;
  MaketDataModel data;

  MaketModel({this.status, this.msg, this.data});

  factory MaketModel.fromJson(Map<String, dynamic> json) =>
      _$MaketModelFromJson(json);
}

@JsonSerializable()
class MaketDataModel {
  String default_trade;
  String currencySymbol;
  String currencyCode;
  List sort;
  List<MaketDataItemModel> dob;
  List<MaketDataItemModel> btc;
  List<MaketDataItemModel> eth;
  List<MaketDataItemModel> New;

  MaketDataModel(
      {this.default_trade,
      this.currencySymbol,
      this.currencyCode,
      this.sort,
      this.dob,
      this.btc,
      this.eth,
      this.New});

  factory MaketDataModel.fromJson(Map<String, dynamic> json) =>
      _$MaketDataModelFromJson(json);
}

@JsonSerializable()
class MaketDataItemModel {
  String price;
  String ratio;
  String amount;
  String money;
  int max;
  int min;
  String currency;
  String usd;
  String sort;
  String type;
  String coin;
  String coinurl;

  MaketDataItemModel(
      {this.price,
      this.ratio,
      this.amount,
      this.money,
      this.max,
      this.min,
      this.currency,
      this.usd,
      this.sort,
      this.type,
      this.coin,
      this.coinurl});

  factory MaketDataItemModel.fromJson(Map<String, dynamic> json) =>
      _$MaketDataItemModelFromJson(json);
}
