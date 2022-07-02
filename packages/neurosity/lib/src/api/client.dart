import 'package:neurosity/src/models/models.dart';

///
abstract class Client {
  bool _validString(String? prop) {
    return prop != null && prop.isNotEmpty;
  }

  bool _validateEmail(String? email) {
    return _validString(email);
  }

  bool _validatePassword(String? password) {
    return _validString(password);
  }

  ///
  bool validateEmailPassword(NeurosityCredentials credentials) {
    return _validateEmail(credentials.email) &&
        _validatePassword(credentials.password);
  }

  ///
  bool validateIdTokenAndProviderId(NeurosityCredentials credentials) {
    return _validString(credentials.idToken) &&
        _validString(credentials.providerId);
  }

  ///
  bool validateCustomToken(NeurosityCredentials credentials) {
    return _validString(credentials.customToken);
  }

  ///
  Future<void> connect();

  ///
  Future<void> login(NeurosityCredentials credentials);

  ///
  Future<List<Device>> getDevices();

  ///
  Future<Device> getDevice(String deviceId);

  ///
  Future<Device?> selectDevice(String deviceId);

  ///
  Stream<Device?> onSelectedDeviceChange();

  ///
  Stream<DeviceStatus?> onStatus();

  ///
  Stream<DeviceSetting?> onSettingsChange();

  ///
  Stream<Metric?> onMetric({
    required String metric,
    String? label,
    required bool atomic,
  });
}
