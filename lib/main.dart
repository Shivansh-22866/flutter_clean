import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/core/secrets/app_secrets.dart';
import 'package:flutter_clean/core/theme/theme.dart';
import 'package:flutter_clean/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_clean/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean/features/auth/domain/useCases/user_sign_up.dart';
import 'package:flutter_clean/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_clean/features/auth/presentation/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseKey,
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => AuthBloc(
            userSignup: UserSignUp(
                AuthRepositoryImpl(AuthRemoteDataSourceImpl(supabase.client)))))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkThemeMode,
        home: const SignInPage());
  }
}
