import 'package:neurosity/src/models/models.dart';

///
List<String>? getLabels(String metric) => metrics[metric]?.keys.toList();

///
bool isMetricDisallowed(String metricName, NeurosityOptions options) {
  return options.skill != null &&
      options.skill?.metrics != null &&
      !options.skill!.metrics.contains(metricName);
}

///
bool hasInvalidLabels(String metric, List<String> labels) {
  final validLabels = getLabels(metric);
  if (validLabels != null) {
    return !labels.every(validLabels.contains);
  } else {
    return false;
  }
}

///
bool validate(
  String metric,
  List<String> labels,
  NeurosityOptions options,
) {
  final validLabels = getLabels(metric)?.join(', ');

  if (labels.isEmpty) {
    throw Exception(
      '''At least one label is required for $metric metric.Please add one of the following labels: $validLabels''',
    );
  }

  if (isMetricDisallowed(metric, options)) {
    throw Exception(
      '''No permission to access the $metric metric. To access this metric, edit the skill's permissions''',
    );
  }

  if (hasInvalidLabels(metric, labels)) {
    throw Exception(
      '''One ore more labels provided to $metric are invalid.The valid labels for $metric are $validLabels''',
    );
  }

  return false;
}
