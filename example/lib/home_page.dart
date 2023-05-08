import 'package:flutter/material.dart';
import 'package:reactive_text_form/reactive_text_form.dart';

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
