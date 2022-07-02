import 'package:neurosity/src/models/models.dart';

///
class SubscriptionManager {
  late final Subscriptions _subscriptions;

  ///
  Subscriptions get() => _subscriptions;

  ///
  List<Subscription> toList() {
    return _subscriptions.values.toList();
  }

  ///
  void add(Subscription subscription) {
    _subscriptions.putIfAbsent(subscription.id, () => subscription);
  }

  ///
  void remove(Subscription subscription) {
    if (!_subscriptions.containsKey(subscription.id)) {
      return;
    }

    _subscriptions.remove(subscription.id);
  }
}

///
class NeurosityDependencies {
  ///
  late final SubscriptionManager subscriptionManager;
}
