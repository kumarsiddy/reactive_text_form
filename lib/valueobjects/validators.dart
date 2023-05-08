abstract class Validators {
  Validators._();

  String? email(String input) {
    const emailRegex = r'''^[A-Za-z0-9+_.-]+@(.+)$''';
    if (RegExp(emailRegex).hasMatch(input)) {
      return null;
    }
    return input;
  }
}
