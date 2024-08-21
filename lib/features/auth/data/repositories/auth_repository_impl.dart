import 'package:flutter_clean/core/error/exceptions.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_clean/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
        email: email,
        password: password,
        name: name,
      );

      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
