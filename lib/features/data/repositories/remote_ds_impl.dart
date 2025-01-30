import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/data/datasources/gymlogix_ds.dart';
import 'package:gymlogix/features/data/models/login_model.dart';
import 'package:gymlogix/features/data/models/plan_model.dart';
import 'package:gymlogix/features/domain/repositories/remote_repo.dart';

class RemoteDsImpl implements RemoteRepo {
  final RemoteDs remoteDataSource;

  RemoteDsImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, LoginModel>> login(String email, String pass) async {
    try {
      final loginData =
          await remoteDataSource.loginToGymlox(email: email, pass: pass);
      if (loginData != null) {
        return Right(loginData);
      }
      return Left(SomeSpecificError("Unable to fetch"));
    } catch (error) {
      return Left(SomeSpecificError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, PlanModel>> getPlans(String token) async {
    try {
      final planData = await remoteDataSource.getPlanData(token: token);
      if (planData != null) {
        return Right(planData);
      }
      return Left(SomeSpecificError("Unable to fetch"));
    } catch (error) {
      return Left(SomeSpecificError(error.toString()));
    }
  }
}
