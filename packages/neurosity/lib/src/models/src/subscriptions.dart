///
class PendingSubscription {
  ///
  const PendingSubscription({
    required this.metric,
    required this.labels,
    required this.atomic,
    this.serverType = 'firebase',
  });

  ///
  final String metric;

  ///
  final List<String> labels;

  ///
  final bool atomic;

  ///
  final String? serverType;
}

///
class Subscription extends PendingSubscription {
  ///
  Subscription({
    required this.id,
    required this.clientId,
    required this.serverType,
    required this.metric,
    required this.labels,
    required this.atomic,
  }) : super(
          metric: metric,
          labels: labels,
          atomic: atomic,
          serverType: serverType,
        );

  ///
  final String id;

  ///
  final String clientId;

  @override
  final String serverType;

  @override
  final String metric;

  @override
  final List<String> labels;

  @override
  final bool atomic;
}

///
typedef Subscriptions = Map<String, Subscription>;
