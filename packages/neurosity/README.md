# Neurosity Dart SDK

The Neurosity software processes and manages the data produced by [Neurosity headsets](https://neurosity.co) which measures, tracks and monitors EEG brainwaves.

## How to use

1- first install the package from `pub.dev`

```dart
 pub get neurosity
```

2- Create a new instance of Neurosity

```dart
 final neurosity = Neurosity();
```

3- You need to make sure you are connected to the the server before you start doing anything

```dart
  await neurosity.connect();
```

4- Once the connection is successful then you need to login to your account

```dart
await neurosity.login(
    NeurosityCredentials.withEmail(
      email: 'xxx@xxx.xxx',
      password: 'xxxx',
    ),
  );
```

5- Now you can interact with your devices or your selected device ID for example

```dart

  final devices = await neurosity.getDevices();
  print(devices);


  final device = await neurosity.selectDevice(
    'DeviceID', // you can grab that from console or from list of devices
  );
  print('select $device');

```

## Example

```dart
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

  neurosity.onSelectedDeviceChange().listen(
    (device) {
      print('onChange $device');
    },
  );

  neurosity.onStatus().listen((deviceStatus) {
    print('onStatus $deviceStatus');
  });

  neurosity.onSettingsChange().listen((deviceStatus) {
    print('onSettingsChange $deviceStatus');
  });

  neurosity.brainwaves(BrainwavesLabel.psd).listen((metric) {
    print('brainwaves $metric');
  });

  neurosity.accelerometer().listen((metric) {
    print('accelerometer $metric');
  });

  neurosity.awareness(AwarenessLabel.focus).listen((metric) {
    print('awareness $metric');
  });

  neurosity.kinesis(KinesisLabel.tongue).listen((metric) {
    print('kinesis $metric');
  });

  neurosity.predictions(KinesisLabel.disappear).listen((metric) {
    print('predictions $metric');
  });

  neurosity.signalQuality().listen((metric) {
    print('KinesisLabel.disappear $metric');
  });
}

```
