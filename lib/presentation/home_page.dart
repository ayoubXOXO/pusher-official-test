import 'package:flutter/material.dart';
import 'package:pusher_ayoub_test/controller/auth.dart';
import 'package:pusher_ayoub_test/presentation/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async => auth
                .signOut()
                .then((value) => Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const LoginPage()),
                      (route) {
                        return false;
                      },
                    )),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
