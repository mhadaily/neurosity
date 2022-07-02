import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

///
@JsonSerializable()
class Device {
  ///
  const Device({
    required this.apiVersion,
    required this.channelNames,
    required this.channels,
    required this.deviceId,
    required this.deviceNickname,
    required this.manufacturer,
    required this.model,
    required this.modelName,
    required this.modelVersion,
    required this.osVersion,
    required this.samplingRate,
  });

  ///
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  ///
  final String? apiVersion;

  ///
  final List<String>? channelNames;

  ///
  final int? channels;

  ///
  final String deviceId;

  ///
  final String? deviceNickname;

  ///
  final String? manufacturer;

  ///
  final String? model;

  ///
  final String? modelName;

  ///
  final String? modelVersion;

  ///
  final String? osVersion;

  ///
  final int? samplingRate;

  ///
  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  @override
  String toString() {
    return {
      'apiVersion': apiVersion,
      'channelNames': channelNames,
      'channels': channels,
      'deviceId': deviceId,
      'deviceNickname': deviceNickname,
      'manufacturer': manufacturer,
      'model': model,
      'modelName': modelName,
      'modelVersion': modelVersion,
      'osVersion': osVersion,
      'samplingRate': samplingRate,
    }.toString();
  }
}
