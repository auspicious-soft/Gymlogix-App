
import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/base/data/datasources/api_endpoints.dart';
import 'package:gymlogix/features/base/data/datasources/network_error.dart'; 
import 'package:gymlogix/network/gymlogix_remote.dart';

import 'models/model_get_exercises.dart';

 
// abstract class WorkoutDsRepo  {
//   Future<Either<Failure, dynamic>> createNewWorkout(String email, String pass); 
// }
class WorkoutDsImpl {
  final remote = GymlogixRemote();
  Future<Either<NetworkAPIStatus, List<dynamic>?>> getItems() async {
    // Mock API call
     final apiStatus = await  remote.requestGetType( endPoint: ApiEndpoints.getFoodPlan);
    print("here calling");
    if (apiStatus.status == NetworkAPIStatus.success){
    // final obj =   GetMealModel.fromJson(apiStatus.data);
return right( ["obj.data"]);
    }
    return left(apiStatus.status);
    
  }

  Future<Either<NetworkAPIStatus, List<ExerciseData>>> getExercies() async {
   
    final apiStatus = await  remote.requestGetType( endPoint: ApiEndpoints.getExercises);
    print("getExercies calling");
    if (apiStatus.status == NetworkAPIStatus.success){
    final obj =   ModelGetExercises.fromJson(apiStatus.data);
    if (obj.status == 0) {
return right( obj.data!);
    }else {
      return left(apiStatus.status);
    }
  
    }
    return left(apiStatus.status);
  }

  Future<Either<NetworkAPIStatus,dynamic>> createSchedule() async{
    /**
     * {
"data": {  
    "schedule_id":"67713b0febe8bba5ed008679",   // this is mongo id - please include this if you want to update. if its not there it willg enerate new schedule
    "type":"workout",   //must type   food,note,workout,measurement',
    "status":"done",   // must be done,in_progress,schedule 
    "finish_at": "2024-12-30T12:00:00Z" ,// this is required to be a valid date time when status is done  use your local time if the value is not done this can be null
    "schedule_at":  "2024-12-29T12:00:00Z",  // must be present. this is the main log time finish_at must be after schedule_at
    "content":{}   // for full list of content refere to the objects in mongo and see how to put  note, food, workout and measurements object


}

}
     */
    return left(NetworkAPIStatus.noData);
  }
}