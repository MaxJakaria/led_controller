import 'package:led_controller/feature/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:led_controller/core/error/exeptions.dart';
import 'package:led_controller/core/error/failure.dart';
import 'package:led_controller/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:led_controller/feature/auth/domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
