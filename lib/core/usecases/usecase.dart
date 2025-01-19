import 'package:dartz/dartz.dart';
import 'package:led_controller/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
