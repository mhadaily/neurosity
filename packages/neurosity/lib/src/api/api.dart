import 'package:neurosity/src/api/client.dart';
import 'package:neurosity/src/models/models.dart';

///
typedef DeviceSelector = Device Function(List<Device> devices);

///
class ApiClient extends Client {
  ///
  ApiClient(
    this.options,
    this.client,
  );

  ///
  final NeurosityOptions options;

  ///
  final Client client;

  @override
  Future<void> connect() => client.connect();

  @override
  Future<void> login(NeurosityCredentials credentials) =>
      client.login(credentials);

  @override
  Future<List<Device>> getDevices() => client.getDevices();

  @override
  Stream<Device?> onSelectedDeviceChange() => client.onSelectedDeviceChange();

  @override
  Stream<DeviceStatus?> onStatus() => client.onStatus();

  @override
  Stream<DeviceSetting?> onSettingsChange() => client.onSettingsChange();

  @override
  Stream<Metric?> onMetric({
    required String metric,
    String? label,
    required bool atomic,
  }) =>
      client.onMetric(
        metric: metric,
        label: label,
        atomic: atomic,
      );

  @override
  Future<Device> getDevice(String deviceId) => client.getDevice(deviceId);

  @override
  Future<Device?> selectDevice(String deviceId) =>
      client.selectDevice(deviceId);
}
