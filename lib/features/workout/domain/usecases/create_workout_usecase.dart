
import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/base/data/datasources/network_error.dart'; 
import 'package:gymlogix/features/workout/data/workout_ds_impl.dart'; 

class CreateWorkoutUsecase {


  final WorkoutDsImpl repository;

  CreateWorkoutUsecase(this.repository);

   Future<Either<NetworkAPIStatus, List<dynamic>?>> execute() {
    return repository.getItems();
  }
}