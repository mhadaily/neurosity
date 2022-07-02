// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metric _$MetricFromJson(Map<String, dynamic> json) => Metric(
      probability: json['probability'] as num,
      label: json['label'] as String,
      timestamp: json['timestamp'] as int,
      metric: json['metric'] as String,
    );

Map<String, dynamic> _$MetricToJson(Metric instance) => <String, dynamic>{
      'probability': instance.probability,
      'label': instance.label,
      'timestamp': instance.timestamp,
      'metric': instance.metric,
    };
