// class FoodDs {

// }

import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/base/data/datasources/network_error.dart';
import 'package:gymlogix/features/food/data/models/get_meal_model.dart';

import '../../base/domain/repositories/remote_repo.dart';

abstract class FoodDSRepo  {
  Future<Either<Failure, dynamic>> createNewFood(String email, String pass);
  Future<Either<NetworkAPIStatus,List<MealData>?>> getMeals();
}
