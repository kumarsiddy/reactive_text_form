import 'package:dartz/dartz.dart';
import 'package:reactive_text_form/valueobjects/i_value_object.dart';
import 'package:reactive_text_form/valueobjects/typedef.dart';
import 'package:reactive_text_form/valueobjects/value_failures/value_failure.dart';

class ValueObject extends IValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ValueObject(
    String input,
    List<ValueValidator> validators,
  ) {
    return ValueObject._(validateInput(input, validators));
  }

  const ValueObject._(this.value);

  static Either<ValueFailure<String>, String> validateInput(
    String input,
    List<ValueValidator> validators,
  ) {
    bool valid = true;
    for (final validator in validators) {
      final validation = validator.call(input);
      if (validation != null) {
        valid = false;
        break;
      }
    }
    if (valid) {
      return right(input);
    }
    return left(ValueFailure.invalidValue(failedValue: input));
  }
}
