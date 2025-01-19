import 'package:dartz/dartz.dart';
import 'package:led_controller/core/error/failure.dart';
import 'package:led_controller/feature/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> loginWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
}
