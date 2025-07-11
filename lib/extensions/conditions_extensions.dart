/// Represents a condition and its associated value.
class ConditionExt<T> {
  final bool Function() condition;
  final T Function() value;

  ConditionExt({required this.condition, required this.value});
}

/// Extension to enable fluent conditional value selection on a condition function.
extension ConditionExtension<T> on bool Function() {
  /// Creates a condition builder with the initial condition and value.
  ConditionBuilder<T> then(T Function() value) {
    return ConditionBuilder<T>._(
      conditions: [ConditionExt(condition: this, value: value)],
    );
  }
}

/// Builder class to chain additional conditions.
class ConditionBuilder<T> {
  final List<ConditionExt<T>> conditions;

  ConditionBuilder._({required this.conditions});

  /// Adds another condition and its corresponding value.
  ConditionBuilder<T> on(bool Function() condition, T Function() value) {
    conditions.add(ConditionExt(condition: condition, value: value));
    return this;
  }

  /// Evaluates conditions in order and returns the value of the first true condition.
  ///
  /// If no condition matches, the [orElse] value is returned if provided.
  /// Throws an [AssertionError] if no conditions are added.
  /// Throws a [StateError] if no condition is met and no [orElse] is provided.
  T build({T Function()? orElse}) {
    assert(
      conditions.isNotEmpty,
      "ConditionBuilder: you must provide at least one condition.",
    );

    for (final condition in conditions) {
      if (condition.condition()) {
        return condition.value();
      }
    }

    if (orElse != null) {
      return orElse();
    }

    throw StateError(
      "ConditionBuilder: No condition was met and no orElse value was provided.",
    );
  }
}
