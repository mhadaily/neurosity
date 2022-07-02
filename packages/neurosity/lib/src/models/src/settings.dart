import 'package:json_annotation/json_annotation.dart';

part 'settings.g.dart';

///
@JsonSerializable()
class DeviceSetting {
  ///
  const DeviceSetting({
    required this.activityLogging,
    required this.hapticsSystem,
    required this.lsl,
    required this.osc,
    required this.researchProgram,
    required this.supportAccess,
  });

  ///
  factory DeviceSetting.fromJson(Map<String, dynamic> json) =>
      _$DeviceSettingFromJson(json);

  ///
  final bool activityLogging;

  ///
  final bool hapticsSystem;

  ///
  final bool lsl;

  ///
  final bool osc;

  ///
  final bool researchProgram;

  ///
  final bool supportAccess;

  ///
  Map<String, dynamic> toJson() => _$DeviceSettingToJson(this);

  @override
  String toString() {
    return {
      'activityLogging': activityLogging,
      'hapticsSystem': hapticsSystem,
      'lsl': lsl,
      'osc': osc,
      'researchProgram': researchProgram,
      'supportAccess': supportAccess,
    }.toString();
  }
}
