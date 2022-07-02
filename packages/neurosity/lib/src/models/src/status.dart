import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

///
enum DeviceStates {
  ///
  online,

  ///
  offline,

  ///
  updating,

  ///
  booting,

  ///
  shuttingOff,
}

///
enum DeviceSleepModeReason {
  ///
  updating,

  ///
  charging,
}

///
@JsonSerializable()
class DeviceStatus {
  ///
  const DeviceStatus({
    required this.battery,
    required this.charging,
    required this.state,
    required this.sleepMode,
    required this.sleepModeReason,
    required this.updatingProgress,
    required this.lastHeartbeat,
    required this.ssid,
  });

  ///
  factory DeviceStatus.fromJson(Map<String, dynamic> json) =>
      _$DeviceStatusFromJson(json);

  ///
  final int battery;

  ///
  final bool charging;

  ///
  final DeviceStates state;

  ///
  final bool sleepMode;

  ///
  final DeviceSleepModeReason? sleepModeReason;

  ///
  final int? updatingProgress;

  ///
  final int? lastHeartbeat;

  ///
  final String ssid;

  ///
  Map<String, dynamic> toJson() => _$DeviceStatusToJson(this);

  @override
  String toString() {
    return {
      'battery': battery,
      'charging': charging,
      'state': state,
      'sleepMode': sleepMode,
      'sleepModeReason': sleepModeReason,
      'updatingProgress': updatingProgress,
      'lastHeartbeat': lastHeartbeat,
      'ssid': ssid,
    }.toString();
  }
}
