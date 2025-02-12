 
import 'package:dartz/dartz.dart'; 
import 'package:gymlogix/features/base/domain/repositories/remote_repo.dart';
import 'package:gymlogix/features/food/data/models/get_meal_model.dart';
import 'package:gymlogix/network/gymlogix_remote.dart'; 
import '../../base/data/datasources/api_endpoints.dart';
import '../../base/data/datasources/network_error.dart'; 
import '../domain/repositories/food_repo.dart';
import 'food_ds.dart';
 
class FoodDsImpl implements FoodDSRepo {
  final GymlogixRemote remoteDataSource;

  FoodDsImpl({required this.remoteDataSource});
 
 
    
  @override
  Future<Either<Failure, dynamic>> createNewFood(String email, String pass) {
    // TODO: implement createNewFood
    throw UnimplementedError();
  }
  
  @override
  Future<Either<NetworkAPIStatus, List<MealData>?>> getMeals()async {
    return left(NetworkAPIStatus.failedToProcess);
    //   try {
         
    //   final apiStatus = await remoteDataSource.requestGetType(endPoint: ApiEndpoints.getFoodPlan);
    //  if (apiStatus.status == NetworkAPIStatus.success){
    //  // final obj =   GetFoodPlanModel.fromJson(apiStatus.data);
    //   //return Right(obj.foodPlanData);
    //   return Left(apiStatus.status);
    //  }else{
    //    return Left(apiStatus.status);
    //  }
    //   } catch (error) {
    //   print("crash ${error.toString()}");
    //  return const Left(NetworkAPIStatus.failedToProcess);
    // }
  }
  
  @override
  Future<Either<NetworkAPIStatus, List<MealData>?>> editMeal() {
    // TODO: implement editMeal
    throw UnimplementedError();
  }
  
  @override
  Future<Either<NetworkAPIStatus, List<MealData>?>> test() {
    // TODO: implement test
    throw UnimplementedError();
  }
 
}
