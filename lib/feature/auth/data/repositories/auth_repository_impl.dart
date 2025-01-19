import 'package:dartz/dartz.dart';
import 'package:led_controller/core/error/exeptions.dart';
import 'package:led_controller/core/error/failure.dart';
import 'package:led_controller/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:led_controller/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userID = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );

      return right(userID);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
