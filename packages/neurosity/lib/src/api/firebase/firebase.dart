import 'dart:async';

import 'package:firebase/firebase_io.dart';
import 'package:firebase_auth_dart/firebase_auth_dart.dart';
import 'package:firebase_core_dart/firebase_core_dart.dart';
import 'package:neurosity/src/api/client.dart';
import 'package:neurosity/src/models/models.dart';

///
class NeurosityFirebase extends Client {
  // todo(majid): add staging
  /// production
  final _firebaseOptions = const FirebaseOptions(
    appId: '',
    apiKey: 'AIzaSyB0TkZ83Fj0CIzn8AAmE-Osc92s3ER8hy8',
    authDomain: 'neurosity-device.firebaseapp.com',
    databaseURL: 'https://neurosity-device.firebaseio.com',
    projectId: 'neurosity-device',
    storageBucket: 'neurosity-device.appspot.com',
    messagingSenderId: '212595049674',
  );

  @override
  Future<void> connect() async {
    await Firebase.initializeApp(options: _firebaseOptions);
    _app = FirebaseAuth.instance;
    final token = await _app.currentUser!.getIdToken();
    _database = FirebaseClient(token);
  }

  late final FirebaseAuth _app;
  late final FirebaseClient _database;

  Device? _selectedDevice;
  final _deviceChanges = StreamController<Device?>.broadcast();
  final _deviceStatus = StreamController<DeviceStatus?>.broadcast();
  final _deviceSettings = StreamController<DeviceSetting?>.broadcast();
  final _metrics = StreamController<Metric?>.broadcast();

  @override
  Future<void> login(NeurosityCredentials credentials) async {
    if (validateEmailPassword(credentials)) {
      // at this point we are 100% email and password are valid
      await _app.signInWithEmailAndPassword(
        credentials.email!,
        credentials.password!,
      );
    }

    if (validateIdTokenAndProviderId(credentials)) {
      throw UnimplementedError();
    }

    if (validateCustomToken(credentials)) {
      throw UnimplementedError();
    }
  }

  Future<String> _getDBPath(String path) async {
    final auth = await _app.currentUser!.getIdToken();
    return '${_firebaseOptions.databaseURL}/$path.json?auth=$auth';
  }

  Future<Map<String, dynamic>?> _getDeviceFromPath(
    String deviceId,
    String path,
  ) async {
    if (_app.currentUser == null) {
      throw Exception('User is not login!');
    }
    final devicePath = await _getDBPath('devices/$deviceId/$path');
    final response = await _database.get(devicePath) as Map<String, dynamic>?;
    return response;
  }

  Future<Metric?> _getDeviceMetric(
    String deviceId,
    String metric,
    String label,
    bool atomic,
  ) async {
    if (_app.currentUser == null) {
      throw Exception('User is not login!');
    }
    const metricPath = 'metrics';
    final String path;
    if (atomic) {
      path = '$metricPath/$metric';
    } else {
      path = '$metricPath/$metric/$label';
    }
    final response = await _getDeviceFromPath(deviceId, path);
    if (response != null) {
      return Metric.fromJson(response);
    }
    return null;
  }

  @override
  Future<Device> getDevice(String deviceId) async {
    final response = await _getDeviceFromPath(deviceId, 'info');
    final json = response ?? {};
    return Device.fromJson(json);
  }

  ///
  FutureOr<DeviceStatus> getDeviceStatus(String deviceId) async {
    final response = await _getDeviceFromPath(deviceId, 'status');
    final json = response ?? {};
    return DeviceStatus.fromJson(json);
  }

  ///
  Future<DeviceSetting> getDeviceSetting(String deviceId) async {
    final response = await _getDeviceFromPath(deviceId, 'settings');
    final json = response ?? {};
    return DeviceSetting.fromJson(json);
  }

  @override
  Future<List<Device>> getDevices() async {
    if (_app.currentUser == null) {
      throw Exception('User is not login!');
    }
    final userId = _app.currentUser!.uid;
    final userIdDevicesPath = await _getDBPath('users/$userId/devices');
    final response = await _database.get(userIdDevicesPath);
    final obj = response as Map<String, dynamic>;
    final deviceIds = obj.keys;
    final devices = <Device>[];

    for (final deviceId in deviceIds) {
      final device = await getDevice(deviceId);
      devices.add(device);
    }

    return devices;
  }

  @override
  Future<Device?> selectDevice(String deviceId) async {
    final devices = await getDevices();
    final device = devices
        .where(
          (device) => device.deviceId == deviceId,
        )
        .first;
    _selectedDevice = device;
    return device;
  }

  @override
  Stream<Device?> onSelectedDeviceChange() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        if (_selectedDevice != null) {
          final _updatedDevice = await getDevice(_selectedDevice!.deviceId);
          _deviceChanges.add(_updatedDevice);
        }
      },
    );
    return _deviceChanges.stream;
  }

  @override
  Stream<DeviceStatus?> onStatus() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        if (_selectedDevice != null) {
          final _updated = await getDeviceStatus(
            _selectedDevice!.deviceId,
          );
          _deviceStatus.add(_updated);
        }
      },
    );

    return _deviceStatus.stream;
  }

  @override
  Stream<DeviceSetting?> onSettingsChange() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        if (_selectedDevice != null) {
          final _updated = await getDeviceSetting(
            _selectedDevice!.deviceId,
          );
          _deviceSettings.add(_updated);
        }
      },
    );

    return _deviceSettings.stream;
  }

  @override
  Stream<Metric?> onMetric({
    required String metric,
    String? label,
    required bool atomic,
  }) {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        if (_selectedDevice != null) {
          final _updated = await _getDeviceMetric(
            _selectedDevice!.deviceId,
            metric,
            label ?? '',
            atomic,
          );
          _metrics.add(_updated);
        }
      },
    );

    return _metrics.stream;
  }
}
