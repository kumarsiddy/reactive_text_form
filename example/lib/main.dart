import 'package:flutter/material.dart';
import 'package:reactive_text_form/reactive_text_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ReactiveTextForm(
                decoration: _getInputDecoration(),
                onChanged: (value) {
                  print('onChange: $value');
                },
                error: 'Invalid email address',
                validators: [
                  _validateEmail,
                  _validateEmail2,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String password) {
    if (password.length < 6) {
      return password;
    }

    return null;
  }

  String? _validateEmail2(String password) {
    if (!password.contains('@')) {
      return password;
    }

    return null;
  }

  InputDecoration _getInputDecoration() {
    return const InputDecoration(
      hintText: 'Please enter your email Address',
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      errorStyle: TextStyle(
        color: Colors.red,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.lightBlue,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
