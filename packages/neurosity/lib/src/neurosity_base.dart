import 'dart:async';

import 'package:neurosity/src/api/api.dart';
import 'package:neurosity/src/api/firebase/firebase.dart';
import 'package:neurosity/src/models/models.dart';
import 'package:neurosity/src/utils/subscription.dart';

/// Neurosity main class
class Neurosity {
  /// Constructor
  Neurosity([
    this.options = const NeurosityOptions(),
  ]);

  /// options
  final NeurosityOptions options;
  late final ApiClient _api;

  ///
  Future<void> connect() async {
    final _client = NeurosityFirebase();
    await _client.connect();
    _api = ApiClient(options, _client);
  }

  ///
  Future<void> disconnect() async {}

  ///
  Future<void> login(
    NeurosityCredentials credentials,
  ) =>
      _api.login(credentials);

  /// Select Device
  ///
  /// Rarely necessary, but useful when the user owns multiple devices.
  ///
  /// A common use case for manually selecting a device is when you wish to build a device dropdown a user can select from, instead of collecting the Device Id from the user ahead of time.
  ///
  /// The 3 steps to manually selecting a device are:
  ///
  /// - Set `autoSelectDevice` to false when instantiating `Neurosity`.
  /// - Authenticate with your Neurosity account to access your devices by calling the `neurosity.login(...)` function.
  /// - Call the `neurosity.selectDevice(...)` function with a device selector function.
  ///
  /// ```dart
  /// final device = await neurosity.selectDevice('someID');
  ///
  /// print(device);
  /// ```
  ///
  /// > If you own multiple devices, and don't pass `autoSelectDevice`, then the first device on the list will be automatically selected.
  ///
  /// For more info, check out the "Device Selection" guide.
  Future<Device?> selectDevice(String deviceId) {
    // todo(majid): ensure the claims
    return _api.selectDevice(deviceId);
  }

  ///
  Future<List<Device>> getDevices() {
    return _api.getDevices();
  }

  ///
  Stream<Device?> onSelectedDeviceChange() {
    return _api.onSelectedDeviceChange();
  }

  ///
  Stream<Metric?> brainwaves(BrainwavesLabel label) {
    return _getMetric(
      metric: MetricsType.brainwaves,
      label: label,
      atomic: false,
    );
  }

  ///
  Stream<dynamic> signalQuality() {
    return _getMetric(
      metric: MetricsType.signalQuality,
      atomic: true,
    );
  }

  ///
  Stream<dynamic> channelAnalysis() {
    return _getMetric(
      metric: MetricsType.channelAnalysis,
      atomic: true,
    );
  }

  ///
  Stream<dynamic> accelerometer() {
    return _getMetric(
      metric: MetricsType.accelerometer,
      atomic: true,
    );
  }

  ///
  Stream<Metric?> awareness(AwarenessLabel label) {
    return _getMetric(
      metric: MetricsType.awareness,
      label: label,
      atomic: false,
    );
  }

  ///
  Stream<Metric?> focus() {
    return _getMetric(
      metric: MetricsType.awareness,
      label: AwarenessLabel.focus,
      atomic: false,
    );
  }

  ///
  Stream<Metric?> calm() {
    return _getMetric(
      metric: MetricsType.awareness,
      label: AwarenessLabel.calm,
      atomic: false,
    );
  }

  ///
  Stream<Metric?> kinesis(KinesisLabel label) {
    return _getMetric(
      metric: MetricsType.kinesis,
      label: label,
      atomic: false,
    );
  }

  ///
  Stream<Metric?> predictions(KinesisLabel label) {
    return _getMetric(
      metric: MetricsType.predictions,
      label: label,
      atomic: false,
    );
  }

  ///
  Stream<DeviceStatus?> onStatus() {
    return _api.onStatus();
  }

  ///
  Stream<DeviceSetting?> onSettingsChange() {
    return _api.onSettingsChange();
  }

  Stream<Metric?> _getMetric({
    required MetricsType metric,
    Enum? label,
    required bool atomic,
  }) {
    if (label != null) {
      final metricError = validate(metric.name, [label.name], options);

      if (metricError) {
        throw Exception(metricError);
      }
    }
    return _api.onMetric(
      metric: metric.name,
      label: atomic && label != null ? label.name : '',
      atomic: atomic,
    );
  }
}
