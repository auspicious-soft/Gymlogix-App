// import 'package:dartz/dartz.dart';
// import 'package:gymlogix/features/base/data/datasources/api_endpoints.dart';
// import 'package:gymlogix/features/base/data/datasources/network_error.dart';
// import 'package:gymlogix/features/base/domain/repositories/remote_repo.dart';
// import 'package:gymlogix/network/gymlogix_remote.dart';

// // abstract class WorkoutDsRepo  {
// //   Future<Either<Failure, dynamic>> createNewWorkout(String email, String pass); 
// // }
// class WorkoutDsRepo {
//   final remote = GymlogixRemote();
//   Future<Either<NetworkAPIStatus, List<dynamic>?>> getItems() async {
//     // Mock API call
//      final apiStatus = await  remote.requestGetType( endPoint: ApiEndpoints.getFoodPlan);
//     print("here calling");
//     if (apiStatus.status == NetworkAPIStatus.success){
//     // final obj =   GetMealModel.fromJson(apiStatus.data);
// return right( ["obj.data"]);
//     }
//     return left(apiStatus.status);
    
//   }
// }