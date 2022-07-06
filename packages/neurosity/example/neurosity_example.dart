import 'package:neurosity/neurosity.dart';

Future<void> main() async {
  final neurosity = Neurosity();

  await neurosity.connect();

  await neurosity.login(
    NeurosityCredentials.withEmail(
      email: const String.fromEnvironment('EMAIL'),
      password: const String.fromEnvironment('PASSWORD'),
    ),
  );

  final devices = await neurosity.getDevices();
  print(devices);

  final device = await neurosity.selectDevice(
    const String.fromEnvironment('DEVICE'),
  );
  print('select $device');

  // neurosity.onSelectedDeviceChange().listen(
  //   (device) {
  //     print('onChange $device');
  //   },
  // );

  // neurosity.onStatus().listen((deviceStatus) {
  //   print('onStatus $deviceStatus');
  // });

  // neurosity.onSettingsChange().listen((deviceStatus) {
  //   print('onSettingsChange $deviceStatus');
  // });

  // neurosity.brainwaves(BrainwavesLabel.psd).listen((metric) {
  //   print('brainwaves $metric');
  // });

  // neurosity.accelerometer().listen((metric) {
  //   print('accelerometer $metric');
  // });

  neurosity.awareness(AwarenessLabel.focus).listen((metric) {
    print('awareness $metric');
  });

  // neurosity.focus().listen((metric) {
  //   print('focus $metric');
  // });

  // neurosity.calm().listen((metric) {
  //   print('calm $metric');
  // });

  // neurosity.kinesis(KinesisLabel.tongue).listen((metric) {
  //   print('kinesis $metric');
  // });

  // neurosity.predictions(KinesisLabel.disappear).listen((metric) {
  //   print('predictions $metric');
  // });

  // neurosity.signalQuality().listen((metric) {
  //   print('KinesisLabel.disappear $metric');
  // });
}
