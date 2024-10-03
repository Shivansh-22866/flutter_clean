import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/core/secrets/app_secrets.dart';
import 'package:flutter_clean/core/theme/theme.dart';
import 'package:flutter_clean/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_clean/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean/features/auth/domain/useCases/user_sign_up.dart';
import 'package:flutter_clean/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_clean/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_clean/init_dependencies.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => serviceLocator<AuthBloc>())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkThemeMode,
        home: const SignInPage());
  }
}
