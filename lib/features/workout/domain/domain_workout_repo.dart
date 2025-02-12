import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/base/data/datasources/network_error.dart';
import 'package:gymlogix/features/base/domain/repositories/remote_repo.dart';
import 'package:gymlogix/features/food/data/models/get_meal_model.dart';

abstract class DomainWorkoutRepo {
  Future<Either<Failure, dynamic>> createNewWorkout(String email, String pass);
   
}
