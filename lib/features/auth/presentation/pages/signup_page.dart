import 'package:flutter/material.dart';
import 'package:flutter_clean/core/theme/app_palette.dart';
import 'package:flutter_clean/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_clean/features/auth/presentation/widgets/auth_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthField(hintText: 'Email'),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(hintText: 'Name'),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(hintText: 'Password'),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthGradientButton(),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Don't have an account?",
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                        TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppPalette.gradient2,
                                    fontWeight: FontWeight.bold))
                      ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
