 
import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/domain/repositories/remote_repo.dart';
import 'package:gymlogix/features/network/gymlogix_remote.dart';

import '../domain/repositories/food_repo.dart';
 
class FoodDsImpl implements FoodRepo {
  final GymlogixRemote remoteDataSource;

  FoodDsImpl({required this.remoteDataSource});
 
 
   

  // @override
  // Future<Either<NetworkAPIStatus, List<FoodPlanData>?>> getFoodPlans()async {
  //   try {
  //     final apiStatus = await remoteDataSource.requestGetType(endPoint: ApiEndpoints.getFoodPlan);
  //    if (apiStatus.status == NetworkAPIStatus.success){
  //     final obj =   GetFoodPlanModel.fromJson(apiStatus.data);
  //     return Right(obj.foodPlanData);
  //    }else{
  //      return Left(apiStatus.status);
  //    }
  //     } catch (error) {
  //     print("crash ${error.toString()}");
  //    return const Left(NetworkAPIStatus.failedToProcess);
  //   }
  // }
  
  @override
  Future<Either<Failure, dynamic>> createNewFood(String email, String pass) {
    // TODO: implement createNewFood
    throw UnimplementedError();
  }
}
