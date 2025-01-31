import 'package:dartz/dartz.dart';

import 'package:gymlogix/features/data/models/login_model.dart';
import 'package:gymlogix/features/data/models/plan_model.dart';

abstract class RemoteRepo {
  Future<Either<Failure, LoginModel>> login(String email, String pass);
  Future<Either<Failure, PlanModel>> getPlans(String token);

  Future<Either<Failure, bool>> signupNormal(Map<String, dynamic> body);
}

abstract class Failure {
  final String message;

  Failure(this.message);
}

class SomeSpecificError extends Failure {
  SomeSpecificError(super.message);
}
