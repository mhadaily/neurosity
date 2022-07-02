import 'package:neurosity/src/models/models.dart';

///
class EmulatorOptions {
  ///
  dynamic mockUserToken;
}

///
class NeurosityOptions {
  ///
  const NeurosityOptions({
    this.deviceId,
    this.autoSelectDevice = true,
    this.timeSync,
    this.emulator,
    this.emulatorHost,
    this.emulatorAuthPort,
    this.emulatorDatabasePort,
    this.emulatorOptions,
    this.emulatorFirestorePort,
    this.emulatorFunctionsPort,
    this.skill,
    this.onDeviceSocketUrl,
  });

  ///
  final String? deviceId;

  ///
  final bool autoSelectDevice;

  ///
  final bool? timeSync;

  ///
  final bool? emulator;

  ///
  final String? emulatorHost;

  ///
  final int? emulatorAuthPort;

  ///
  final int? emulatorDatabasePort;

  ///
  final EmulatorOptions? emulatorOptions;

  ///
  final int? emulatorFunctionsPort;

  ///
  final int? emulatorFirestorePort;

  ///
  final Skill? skill;

  ///
  final String? onDeviceSocketUrl;
}
