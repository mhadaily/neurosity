import 'package:json_annotation/json_annotation.dart';
part 'metric.g.dart';

///
enum MetricsType {
  ///
  brainwaves,

  ///
  signalQuality,

  ///
  channelAnalysis,

  ///
  accelerometer,

  ///
  awareness,

  ///
  kinesis,

  ///
  predictions
}

///
@JsonSerializable()
class Metric {
  ///
  const Metric({
    required this.probability,
    required this.label,
    required this.timestamp,
    required this.metric,
  });

  ///
  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);

  ///
  final num probability;

  ///
  final String label;

  ///
  final int timestamp;

  ///
  final String metric;

  ///
  Map<String, dynamic> toJson() => _$MetricToJson(this);

  @override
  String toString() {
    return {
      'probability': probability,
      'label': label,
      'timestamp': timestamp,
      'metric': metric,
    }.toString();
  }
}
