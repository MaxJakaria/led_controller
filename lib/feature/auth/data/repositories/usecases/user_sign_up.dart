import 'package:dartz/dartz.dart';
import 'package:led_controller/core/error/failure.dart';
import 'package:led_controller/core/usecases/usecase.dart';
import 'package:led_controller/feature/auth/domain/entities/user.dart';
import 'package:led_controller/feature/auth/domain/repositories/auth_repository.dart';

class UserSignUp implements Usecase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
