## Package Name

This is a package for Flutter that provides a simple and intuitive way to work with forms in
Flutter. It allows you to easily create forms with validation in realtime.

## How to install

```yaml
dependencies:
  package_name: ^latest version
```

Replace package_name with the name of your package and version with the version number you want to
use.

Then run ```flutter pub get``` in your terminal to install the package.

## Usage

When you use Flutter's built-in TextFormField widget, it provides a convenient way to capture user
input. However, it does not have the capability to check the value of the input as it is entered.
Instead, you need to call the form's validate method to check for the values after the user submits
the form. This is where a validation package can be useful. The package mentioned in the statement
performs a very simple task - it validates the entered value for every text field in real-time as
the user enters the value.

With this package, you can set up validation rules for each text field, such as ensuring that the
input is not empty, or that it matches a certain pattern or format. As the user enters text, the
validation function is called and the field's error message is updated in real-time.

This can be a useful feature for forms that have multiple fields and require more complex validation
rules. By using a package like this, you can simplify the validation process and provide a better
user experience by giving instant feedback on any errors in the form.

## Example

The package being discussed provides a ReactiveTextForm widget that you can use instead of the
built-in TextFormField widget to easily validate user input in real-time. The ReactiveTextForm
widget supports every parameter of TextFormField, so you can use it just like you would use the
built-in widget.

To use the ReactiveTextForm widget, simply replace TextFormField with ReactiveTextForm in your code.
You can pass in as many validators as you need to the ReactiveTextForm widget to validate the user
input. Validators are functions that take in a String value as input and return a String?. If the
input is valid, the validator should return null. If the input is invalid, the validator should
return a String error message that describes the issue with the input.

For example, let's say you want to validate that a user enters a valid email address in a
ReactiveTextForm. You can add a validator function like this:

```dart
String? validateEmail(String value) {
  if (!value.contains('@')) {
    return value;
  }
  return null;
}
```

Then, when you define your ReactiveTextForm, you can pass in this validator function like this:

```dart
ReactiveTextForm
(
validators
:
[
validateEmail
,
]
,
)
,
```

It's important to note that every validator function should have a return type of String?. If the
input is valid, the function should return null. If the input is invalid, the function should return
the same String value that was passed in as input. This is because the ReactiveTextForm widget uses
the error message passed in error parameter.

In summary, using the ReactiveTextForm widget is very simple. Just replace TextFormField with
ReactiveTextForm in your code, and add any validators you need to validate the user input. Following
the simple rule for writing validators will ensure that your ReactiveTextForm widget works properly
and provides real-time validation feedback to the user.

```dart

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ReactiveTextForm(
              onChanged: (value) {
                print('onChange: $value');
              },
              error: 'Invalid Password',
              validators: [
                _validateYourPassword,
                _validateYourPassword2,
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _validateYourPassword(String password) {
    if (password.length < 6) {
      return password;
    }

    return null;
  }

  String? _validateYourPassword2(String password) {
    if (!password.contains('@')) {
      return password;
    }

    return null;
  }
}


```

## Credits

We are using Freezed and dartz package internally

## Contact

Reach me at purushotam.kr@hotmail.com (Open for freelancing and contract)
