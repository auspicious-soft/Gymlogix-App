 
import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/base/data/datasources/api_endpoints.dart';
import 'package:gymlogix/features/base/data/datasources/network_error.dart';
import 'package:gymlogix/features/base/data/models/get_food_plan_model.dart';
import 'package:gymlogix/features/food/data/models/get_meal_model.dart';
import 'package:gymlogix/features/food/domain/entities/exploreitem.dart';
import 'package:gymlogix/network/gymlogix_remote.dart';

class FoodRepository {
  final remote = GymlogixRemote();
  Future<Either<NetworkAPIStatus, List<MealData>?>> getItems() async {
    // Mock API call
     final apiStatus = await  remote.requestGetType( endPoint: ApiEndpoints.getFoodPlan);
    print("here calling");
    if (apiStatus.status == NetworkAPIStatus.success){
     final obj =   GetMealModel.fromJson(apiStatus.data);
return right( obj.data);
    }
    return left(apiStatus.status);
    
  }
}