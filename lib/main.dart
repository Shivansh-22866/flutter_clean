import 'package:flutter/material.dart';
import 'package:flutter_clean/core/theme/theme.dart';
import 'package:flutter_clean/features/auth/presentation/pages/login_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const SignInPage()
    );
  }
}