// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceSetting _$DeviceSettingFromJson(Map<String, dynamic> json) =>
    DeviceSetting(
      activityLogging: json['activityLogging'] as bool,
      hapticsSystem: json['hapticsSystem'] as bool,
      lsl: json['lsl'] as bool,
      osc: json['osc'] as bool,
      researchProgram: json['researchProgram'] as bool,
      supportAccess: json['supportAccess'] as bool,
    );

Map<String, dynamic> _$DeviceSettingToJson(DeviceSetting instance) =>
    <String, dynamic>{
      'activityLogging': instance.activityLogging,
      'hapticsSystem': instance.hapticsSystem,
      'lsl': instance.lsl,
      'osc': instance.osc,
      'researchProgram': instance.researchProgram,
      'supportAccess': instance.supportAccess,
    };
