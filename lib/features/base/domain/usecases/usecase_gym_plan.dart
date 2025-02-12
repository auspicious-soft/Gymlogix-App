import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/base/data/datasources/network_error.dart';
import 'package:gymlogix/features/base/data/models/get_food_plan_model.dart';
import 'package:gymlogix/features/base/data/models/gymplan_model.dart';
import 'package:gymlogix/features/base/domain/repositories/remote_repo.dart';

class UsecaseGymPlan {
  final RemoteRepo fromRemoteRepo;

  UsecaseGymPlan({required this.fromRemoteRepo});

  Future<Either<NetworkAPIStatus, List<GymPlanData>>> getAllPlans() async{
    return await fromRemoteRepo.getAllPlans();
  }

 Future<Either<NetworkAPIStatus, List<FoodPlanData>?>> getFoodPlans() async{
    return await fromRemoteRepo.getFoodPlans();
  }
  
}
