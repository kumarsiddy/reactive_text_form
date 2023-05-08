import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:reactive_text_form/valueobjects/typedef.dart';
import 'package:reactive_text_form/valueobjects/value_failures/failures.dart';
import 'package:reactive_text_form/valueobjects/value_failures/value_failure.dart';

@immutable
abstract class IValueObject<T> {
  final String? initialValue;

  const IValueObject({
    this.initialValue,
  });

  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    return value.fold(
      (failure) => throw UnexpectedValueError(failure),
      (r) => r,
    );
  }

  /// This will return the valid value, if value is not valid then null
  T get() {
    return value.getOrElse(
      () => null as T,
    );
  }

  T getOrElse(ValueCallback<T> l) {
    return value.fold(
      (failure) => l.call(),
      (r) => r,
    );
  }

  /// This will return the value irrespective of validity
  String get input => value.fold(
        (l) {
          return l.failedValue;
        },
        (r) => r.toString(),
      );

  bool isValid() => value.isRight();

  bool isNotValid() => value.isLeft();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IValueObject<T> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'ValueObject{value: $value}';
  }
}