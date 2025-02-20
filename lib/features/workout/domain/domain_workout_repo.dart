import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/base/data/datasources/network_error.dart';
import 'package:gymlogix/features/base/domain/repositories/remote_repo.dart';
import 'package:gymlogix/features/food/data/models/get_meal_model.dart';

enum ScheduleType{
  food,note,workout,measurement
}
abstract class DomainWorkoutRepo {
  Future<Either<Failure, dynamic>> createNewWorkout(String email, String pass);
  /**
   * "data": {  
    "schedule_id":"67713b0febe8bba5ed008679",   // this is mongo id - please include this if you want to update. if its not there it willg enerate new schedule
    "type":"workout",   //must type   food,note,workout,measurement',
    "status":"done",   // must be done,in_progress,schedule 
    "finish_at": "2024-12-30T12:00:00Z" ,// this is required to be a valid date time when status is done  use your local time if the value is not done this can be null
    "schedule_at":  "2024-12-29T12:00:00Z",  // must be present. this is the main log time finish_at must be after schedule_at
    "content":{}   // for full list of content refere to the objects in mongo and see how to put  note, food, workout and measurements object

   */
   Future<Either<Failure,dynamic>> createNewOrUpdateSchedule({ required String scheduleID,
   required ScheduleType type, required String status,
   required String? finishAt, required String scheduleAt, required Map<String,dynamic> content
   });
}
