
import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/base/data/datasources/network_error.dart';
import 'package:gymlogix/features/workout/data/models/model_get_exercises.dart';
import  'package:gymlogix/features/workout/data/workout_ds_impl.dart';
 
class GetExerciseUsecase {
  final WorkoutDsImpl repository;
  GetExerciseUsecase(this.repository);
   Future<Either<NetworkAPIStatus, List<ExerciseData>?>> execute() {
    return repository.getExercies();
  }
}