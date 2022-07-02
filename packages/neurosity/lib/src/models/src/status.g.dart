// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceStatus _$DeviceStatusFromJson(Map<String, dynamic> json) => DeviceStatus(
      battery: json['battery'] as int,
      charging: json['charging'] as bool,
      state: $enumDecode(_$DeviceStatesEnumMap, json['state']),
      sleepMode: json['sleepMode'] as bool,
      sleepModeReason: $enumDecodeNullable(
          _$DeviceSleepModeReasonEnumMap, json['sleepModeReason']),
      updatingProgress: json['updatingProgress'] as int?,
      lastHeartbeat: json['lastHeartbeat'] as int?,
      ssid: json['ssid'] as String,
    );

Map<String, dynamic> _$DeviceStatusToJson(DeviceStatus instance) =>
    <String, dynamic>{
      'battery': instance.battery,
      'charging': instance.charging,
      'state': _$DeviceStatesEnumMap[instance.state],
      'sleepMode': instance.sleepMode,
      'sleepModeReason':
          _$DeviceSleepModeReasonEnumMap[instance.sleepModeReason],
      'updatingProgress': instance.updatingProgress,
      'lastHeartbeat': instance.lastHeartbeat,
      'ssid': instance.ssid,
    };

const _$DeviceStatesEnumMap = {
  DeviceStates.online: 'online',
  DeviceStates.offline: 'offline',
  DeviceStates.updating: 'updating',
  DeviceStates.booting: 'booting',
  DeviceStates.shuttingOff: 'shuttingOff',
};

const _$DeviceSleepModeReasonEnumMap = {
  DeviceSleepModeReason.updating: 'updating',
  DeviceSleepModeReason.charging: 'charging',
};
