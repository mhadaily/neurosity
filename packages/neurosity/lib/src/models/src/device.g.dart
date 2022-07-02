// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      apiVersion: json['apiVersion'] as String?,
      channelNames: (json['channelNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      channels: json['channels'] as int?,
      deviceId: json['deviceId'] as String,
      deviceNickname: json['deviceNickname'] as String?,
      manufacturer: json['manufacturer'] as String?,
      model: json['model'] as String?,
      modelName: json['modelName'] as String?,
      modelVersion: json['modelVersion'] as String?,
      osVersion: json['osVersion'] as String?,
      samplingRate: json['samplingRate'] as int?,
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'channelNames': instance.channelNames,
      'channels': instance.channels,
      'deviceId': instance.deviceId,
      'deviceNickname': instance.deviceNickname,
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'modelName': instance.modelName,
      'modelVersion': instance.modelVersion,
      'osVersion': instance.osVersion,
      'samplingRate': instance.samplingRate,
    };
