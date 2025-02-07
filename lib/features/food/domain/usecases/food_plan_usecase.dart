import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/data/datasources/network_error.dart';
import 'package:gymlogix/features/domain/repositories/remote_repo.dart';
import 'package:gymlogix/features/food/data/food_ds_impl.dart';
import 'package:gymlogix/features/food/data/models/get_meal_model.dart';
import 'package:gymlogix/features/food/data/repositories/food_repository.dart';
import 'package:gymlogix/features/food/domain/repositories/domain_food_repo.dart';
import 'package:gymlogix/features/network/gymlogix_remote.dart';

import '../../data/food_ds.dart';
import '../repositories/food_repo.dart';
 

class FoodPlanUseCase {


  final FoodRepository repository;

  FoodPlanUseCase(this.repository);

   Future<Either<NetworkAPIStatus, List<MealData>?>> execute() {
    return repository.getItems();
  }
}

//   final DomainFoodRepo repository;

//   FoodPlanUseCase({required this.repository});

//   Future<Either<NetworkAPIStatus, dynamic>>   getMyMeals() async{
//     return await repository.getMeals();
//   }
 
// }