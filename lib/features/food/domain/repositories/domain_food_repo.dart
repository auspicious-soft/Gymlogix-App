 import 'package:dartz/dartz.dart'; 
import 'package:gymlogix/features/base/data/datasources/network_error.dart'; 
import '../../../base/domain/repositories/remote_repo.dart';
import '../../data/models/get_meal_model.dart';

abstract class DomainFoodRepo {
  Future<Either<Failure, dynamic>> createNewFood(String email, String pass);
   Future<Either<NetworkAPIStatus,List<MealData>?>> getMeals();
   Future<Either<NetworkAPIStatus,List<MealData>?>> editMeal();
    Future<Either<NetworkAPIStatus,List<MealData>?>> testok();
}
