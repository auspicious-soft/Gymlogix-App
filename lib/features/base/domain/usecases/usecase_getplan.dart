import 'package:dartz/dartz.dart';

import 'package:gymlogix/features/base/data/models/plan_model.dart';

import 'package:gymlogix/features/base/domain/repositories/remote_repo.dart';

class UsecaseGetplan {
  final RemoteRepo repository;

  UsecaseGetplan({required this.repository});

  Future<Either<Failure, PlanModel>> call({required String token}) {
    return repository.getPlans(token);
  }
}
