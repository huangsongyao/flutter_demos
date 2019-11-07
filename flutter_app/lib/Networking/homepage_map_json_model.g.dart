// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage_map_json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomepageModel _$HomepageModelFromJson(Map<String, dynamic> json) {
  return HomepageModel(
      data: json['data'] == null
          ? null
          : HomepageDataModel.fromJson(json['data'] as Map<String, dynamic>),
      code: json['code'] as int,
      msg: json['msg'] as String);
}

Map<String, dynamic> _$HomepageModelToJson(HomepageModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'code': instance.code,
      'msg': instance.msg
    };

HomepageDataModel _$HomepageDataModelFromJson(Map<String, dynamic> json) {
  return HomepageDataModel(
      amountToBeRepaid: json['amountToBeRepaid'] as String,
      msgInfo: (json['msgInfo'] as List)
          ?.map((e) => e == null
              ? null
              : HomepageDataMessageInfoModel.fromJson(
                  e as Map<String, dynamic>))
          ?.toList(),
      modules: (json['modules'] as List)
          ?.map((e) => e == null
              ? null
              : HomepageDataModulesModel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomepageDataModelToJson(HomepageDataModel instance) =>
    <String, dynamic>{
      'amountToBeRepaid': instance.amountToBeRepaid,
      'msgInfo': instance.msgInfo,
      'modules': instance.modules
    };

HomepageDataMessageInfoModel _$HomepageDataMessageInfoModelFromJson(
    Map<String, dynamic> json) {
  return HomepageDataMessageInfoModel()
    ..castType = json['castType'] as int
    ..userId = json['userId'] as int
    ..ticker = json['ticker'] as String
    ..text = json['text'] as String
    ..title = json['title'] as String
    ..actionType = json['actionType'] as int
    ..action = json['action'] as String
    ..displayType = json['displayType'] as int
    ..description = json['description'] as String
    ..startDate = json['startDate'] as String
    ..endDate = json['endDate'] as String
    ..extraInfo = json['extraInfo'] as String
    ..readFlag = json['readFlag'] as int
    ..createTime = json['createTime'] as String
    ..startDateTime = json['startDateTime'] as String
    ..startTimeStamp = json['startTimeStamp'] as String;
}

Map<String, dynamic> _$HomepageDataMessageInfoModelToJson(
        HomepageDataMessageInfoModel instance) =>
    <String, dynamic>{
      'castType': instance.castType,
      'userId': instance.userId,
      'ticker': instance.ticker,
      'text': instance.text,
      'title': instance.title,
      'actionType': instance.actionType,
      'action': instance.action,
      'displayType': instance.displayType,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'extraInfo': instance.extraInfo,
      'readFlag': instance.readFlag,
      'createTime': instance.createTime,
      'startDateTime': instance.startDateTime,
      'startTimeStamp': instance.startTimeStamp
    };

HomepageDataModulesModel _$HomepageDataModulesModelFromJson(
    Map<String, dynamic> json) {
  return HomepageDataModulesModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
      redCount: json['redCount'] as int,
      createTime: json['createTime'] as String,
      createUser: json['createUser'] as String,
      updateTime: json['updateTime'] as String);
}

Map<String, dynamic> _$HomepageDataModulesModelToJson(
        HomepageDataModulesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'image': instance.image,
      'url': instance.url,
      'redCount': instance.redCount,
      'createTime': instance.createTime,
      'createUser': instance.createUser,
      'updateTime': instance.updateTime
    };
