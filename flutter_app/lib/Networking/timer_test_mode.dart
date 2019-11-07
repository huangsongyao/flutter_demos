import 'package:json_annotation/json_annotation.dart';

part 'timer_test_mode.g.dart';
@JsonSerializable()
class TimerMode {

  int status;
  String msg;
  TimerMode({this.status, this.msg});
  factory TimerMode.fromJson(Map<String, dynamic> json) => _$TimerModeFromJson(json);
}