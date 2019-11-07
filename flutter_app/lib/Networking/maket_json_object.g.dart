// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maket_json_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaketModel _$MaketModelFromJson(Map<String, dynamic> json) {
  return MaketModel(
      status: json['status'] as int,
      msg: json['msg'] as String,
      data: json['data'] == null
          ? null
          : MaketDataModel.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MaketModelToJson(MaketModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data
    };

MaketDataModel _$MaketDataModelFromJson(Map<String, dynamic> json) {
  return MaketDataModel(
      default_trade: json['default_trade'] as String,
      currencySymbol: json['currencySymbol'] as String,
      currencyCode: json['currencyCode'] as String,
      sort: json['sort'] as List,
      dob: (json['dob'] as List)
          ?.map((e) => e == null
              ? null
              : MaketDataItemModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      btc: (json['btc'] as List)
          ?.map((e) => e == null
              ? null
              : MaketDataItemModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      eth: (json['eth'] as List)
          ?.map((e) => e == null
              ? null
              : MaketDataItemModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      New: (json['New'] as List)
          ?.map((e) => e == null
              ? null
              : MaketDataItemModel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MaketDataModelToJson(MaketDataModel instance) =>
    <String, dynamic>{
      'default_trade': instance.default_trade,
      'currencySymbol': instance.currencySymbol,
      'currencyCode': instance.currencyCode,
      'sort': instance.sort,
      'dob': instance.dob,
      'btc': instance.btc,
      'eth': instance.eth,
      'New': instance.New
    };

MaketDataItemModel _$MaketDataItemModelFromJson(Map<String, dynamic> json) {
  return MaketDataItemModel(
      price: json['price'] as String,
      ratio: json['ratio'] as String,
      amount: json['amount'] as String,
      money: json['money'] as String,
      max: json['max'] as int,
      min: json['min'] as int,
      currency: json['currency'] as String,
      usd: json['usd'] as String,
      sort: json['sort'] as String,
      type: json['type'] as String,
      coin: json['coin'] as String,
      coinurl: json['coinurl'] as String);
}

Map<String, dynamic> _$MaketDataItemModelToJson(MaketDataItemModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'ratio': instance.ratio,
      'amount': instance.amount,
      'money': instance.money,
      'max': instance.max,
      'min': instance.min,
      'currency': instance.currency,
      'usd': instance.usd,
      'sort': instance.sort,
      'type': instance.type,
      'coin': instance.coin,
      'coinurl': instance.coinurl
    };
