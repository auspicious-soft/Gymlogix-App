import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:gymlogix/features/food/data/models/get_meal_model.dart'; 
import 'package:gymlogix/features/workout/data/workout_ds_impl.dart';
import 'package:gymlogix/features/workout/domain/create_workout_usecase.dart';
  


  //DATA SOURCE 
 final _dataSourceProviderForWorkout = Provider<WorkoutDsImpl>((ref) {
  return WorkoutDsImpl();
});

final useCaseProviderForCreateWorkOut = Provider<CreateWorkoutUsecase>((ref) {
  // final localDataSource = ref.read(remoteDataSourceProvider);
  final remoteDataSource = ref.read(_dataSourceProviderForWorkout);
  return CreateWorkoutUsecase(remoteDataSource);
});


 //END


// /// Provider for the login use case
final createWorkoutProvider = Provider<CreateWorkoutUsecase>((ref) {
  final repository = ref.read(_dataSourceProviderForWorkout);
  return CreateWorkoutUsecase( repository);
});
 
final stateCreateWorkoutProvider =
    StateNotifierProvider<WorkoutDataNotifier, AsyncValue<List<dynamic>?>>(
        (ref) {
  final getPlan = ref.read(createWorkoutProvider);
  return WorkoutDataNotifier(getPlan);
});

 

class WorkoutDataNotifier extends StateNotifier<AsyncValue<List<MealData>?>> {
  final CreateWorkoutUsecase _useCase;

  WorkoutDataNotifier(this._useCase) : super(const AsyncValue.loading()){
createWorkoutPlan();
  }
//  Whatever(): super(const AsyncValue.loading()) {
//     _fetch();
//   }

  Future<void> createWorkoutPlan() async {
    try {
      state = const AsyncValue.loading();
      final data = await _useCase.execute();
       print("reach here ${data}");
      data.fold(
        (error) {
          state =
              AsyncValue.error(error, StackTrace.fromString("Failed to list"));
        },
        (fineData) {
           print("workout reach here ${fineData?.length}");
          //state = AsyncData(fineData);
        },
      );
    } catch (e) {
      state =
          AsyncValue.error(e, StackTrace.fromString("Failed to execute list"));
    }
  }
}
