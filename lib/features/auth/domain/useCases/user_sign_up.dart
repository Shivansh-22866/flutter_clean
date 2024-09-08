import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/core/useCase/usecase.dart';
import 'package:flutter_clean/features/auth/domain/entities/user.dart';
import 'package:flutter_clean/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String password;
  final String email;
  final String name;

  UserSignUpParams(
      {required this.password, required this.email, required this.name});
}
