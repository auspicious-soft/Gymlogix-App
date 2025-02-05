 
import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/data/datasources/gymlogix_ds.dart';
import 'package:gymlogix/features/data/models/get_food_plan_model.dart';
import 'package:gymlogix/features/data/models/gymplan_model.dart';
import 'package:gymlogix/features/data/models/login_model.dart';
import 'package:gymlogix/features/data/models/plan_model.dart';
import 'package:gymlogix/features/domain/repositories/remote_repo.dart';

import '../datasources/api_endpoints.dart';
import '../datasources/network_error.dart';

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
      //  print("return from here");
      return Left(SomeSpecificError("Unable to fetch"));
    } catch (error) {
      print("return ok from here ${error.toString()}");
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

  @override
  Future<Either<Failure, bool>> signupNormal(Map<String, dynamic> body) async {
    try {
      final pData = await remoteDataSource.signupNormal(body);

      if (pData) {
        return const Right(true);
      }
      return Left(SomeSpecificError(pData));
    } catch (e) {
      return Left(SomeSpecificError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkAPIStatus, List<GymPlanData>>> getAllPlans() async  {
   try {
      final planData = await remoteDataSource.getAllPlans();
      print(planData.status);
       print("Here data count ${planData.data.length}");
      if (planData.status == NetworkAPIStatus.success) {
        print("true");
       final asData = planData.data as List<GymPlanData>;
        return Right(asData);
      }
      return Left(planData.status);
    } catch (error) {
      print("crash ${error.toString()}");
     return const Left(NetworkAPIStatus.failedToProcess);
    }
  }

  @override
  Future<Either<NetworkAPIStatus, List<FoodPlanData>?>> getFoodPlans()async {
    try {
      final apiStatus = await remoteDataSource.requestGetType(endPoint: ApiEndpoints.getFoodPlan);
     if (apiStatus.status == NetworkAPIStatus.success){
      final obj =   GetFoodPlanModel.fromJson(apiStatus.data);
      return Right(obj.foodPlanData);
     }else{
       return Left(apiStatus.status);
     }
      } catch (error) {
      print("crash ${error.toString()}");
     return const Left(NetworkAPIStatus.failedToProcess);
    }
  }
}
