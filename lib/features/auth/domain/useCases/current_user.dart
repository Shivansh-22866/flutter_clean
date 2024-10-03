import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/core/useCase/usecase.dart';
import 'package:flutter_clean/features/auth/domain/entities/user.dart';
import 'package:flutter_clean/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
