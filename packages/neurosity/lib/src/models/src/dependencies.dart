import 'package:neurosity/src/api/api.dart';
import 'package:neurosity/src/models/models.dart';

///
class MetricDependencies {
  ///
  MetricDependencies({
    required this.options,
    required this.api,
    required this.onDeviceChange,
    this.isLocalMode,
    this.socketUrl,
    required this.status,
  });

  ///
  final NeurosityOptions options;

  ///
  final ApiClient api;

  ///
  final Function onDeviceChange;

  ///
  final bool? isLocalMode;

  ///
  final String? socketUrl;

  ///
  final Function status;
}
