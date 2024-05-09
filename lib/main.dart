import 'package:flutter/material.dart';
import 'package:signupproject/login.dart';
import 'package:signupproject/register.dart';
import 'package:signupproject/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'start_screen',
      routes: {
        'start_screen': (context) => const MyStart(),
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
      },
    ),
  );
}
