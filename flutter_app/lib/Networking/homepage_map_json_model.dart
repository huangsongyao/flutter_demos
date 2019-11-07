import 'package:json_annotation/json_annotation.dart';

part 'homepage_map_json_model.g.dart';

@JsonSerializable()
class HomepageModel {
  HomepageDataModel data;
  int code;
  String msg;

  HomepageModel({this.data, this.code, this.msg});

  factory HomepageModel.fromJson(Map<String, dynamic> json) =>
      _$HomepageModelFromJson(json);
}

@JsonSerializable()
class HomepageDataModel {
  String amountToBeRepaid;
  List<HomepageDataMessageInfoModel> msgInfo;
  List<HomepageDataModulesModel> modules;

  HomepageDataModel({this.amountToBeRepaid, this.msgInfo, this.modules});

  factory HomepageDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomepageDataModelFromJson(json);
}

@JsonSerializable()
class HomepageDataMessageInfoModel {
  int castType;
  int userId;
  String ticker;
  String text;
  String title;
  int actionType;
  String action;
  int displayType;
  String description;
  String startDate;
  String endDate;
  String extraInfo;
  int readFlag;
  String createTime;
  String startDateTime;
  String startTimeStamp;

  HomepageDataMessageInfoModel(
      {this.castType,
      this.userId,
      this.ticker,
      this.text,
      this.title,
      this.actionType,
      this.action,
      this.displayType,
      this.description,
      this.startDate,
      this.endDate,
      this.extraInfo,
      this.readFlag,
      this.createTime,
      this.startDateTime,
      this.startTimeStamp});

  factory HomepageDataMessageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$HomepageDataMessageInfoModelFromJson(json);
}

@JsonSerializable()
class HomepageDataModulesModel {
  int id;
  String code;
  String name;
  String image;
  String url;
  int redCount;
  String createTime;
  String createUser;
  String updateTime;

  HomepageDataModulesModel(
      {this.id,
      this.code,
      this.name,
      this.image,
      this.url,
      this.redCount,
      this.createTime,
      this.createUser,
      this.updateTime});

  factory HomepageDataModulesModel.fromJson(Map<String, dynamic> json) =>
      _$HomepageDataModulesModelFromJson(json);

  bool hasRedCount() {
    return (this.redCount > 0);
  }
}
