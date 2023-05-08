import 'package:reactive_text_form/valueobjects/value_failures/value_failure.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    return Error.safeToString(
      '''Encountered a ValueFailure at an unrecoverable point. Terminating... Failure was $valueFailure''',
    );
  }
}
