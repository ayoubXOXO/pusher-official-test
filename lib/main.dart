import 'package:flutter/material.dart';
import 'package:pusher_ayoub_test/light/theme_data.dart';

import 'presentation/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      title: 'Material App',
      home: const LoginPage(),
    );
  }
}
