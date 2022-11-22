import 'package:flutter/material.dart';
import 'package:pusher_ayoub_test/controller/auth.dart';
import 'package:pusher_ayoub_test/helpers/spacing.dart';
import 'package:pusher_ayoub_test/presentation/widget/button.dart';
import 'package:pusher_ayoub_test/presentation/widget/input.dart';

import '../helpers/regx.dart';
import 'widget/body_wrapper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final AuthController _authController = AuthController();
  @override
  void initState() {
    _authController.initDio(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWrapper(
          bodyWidthFactor: .85,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlutterLogo(),
                AppSpacing.extraBigGap,
                WiggliInput(
                  initialValue: 'test@test.fr',
                  autofillHints: const [AutofillHints.email],
                  hint: 'email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'email_is_required';
                    } else if (!const Validator().email(email)) {
                      return 'pls_set_a_valid_email';
                    }
                    _authController.email = email;
                    return null;
                  },
                ),
                AppSpacing.smallGap,
                WiggliInput(
                  initialValue: 'Pa5@sword',
                  keyboardType: TextInputType.visiblePassword,
                  autofillHints: const [AutofillHints.password],
                  hint: 'password',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock),
                  isPasswordInput: true,
                  validator: (pwd) {
                    if (pwd!.isEmpty) {
                      return 'password_is_required';
                    }
                    _authController.pwd = pwd;
                    return null;
                  },
                ),
                AppSpacing.bigGap,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppSpacing.mediumGap,
                    AppButton(
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            await _authController.signIn(context);
                          }
                        },
                        text: 'login')
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
