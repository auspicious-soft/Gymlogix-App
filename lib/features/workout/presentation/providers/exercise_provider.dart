import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/features/food/data/models/get_meal_model.dart';
import 'package:gymlogix/features/workout/data/workout_ds_impl.dart';
import 'package:gymlogix/features/workout/domain/usecases/create_workout_usecase.dart';
import 'package:gymlogix/features/workout/domain/usecases/get_exercise_usecase.dart';

import '../../data/models/model_get_exercises.dart';

//DATA SOURCE
final _dataSourceProviderForWorkout = Provider<WorkoutDsImpl>((ref) {
  return WorkoutDsImpl();
});

final useCaseProviderGetExercise = Provider<GetExerciseUsecase>((ref) {
  // final localDataSource = ref.read(remoteDataSourceProvider);
  final remoteDataSource = ref.read(_dataSourceProviderForWorkout);
  return GetExerciseUsecase(remoteDataSource);
});

//END

// /// Provider for the login use case
final getExerciseProvider = Provider<GetExerciseUsecase>((ref) {
  final repository = ref.read(_dataSourceProviderForWorkout);
  return GetExerciseUsecase(repository);
});

final stateGetExerciseProvider =
    StateNotifierProvider<ExerciseDataNotifier, AsyncValue<List<ExerciseData>>>(
        (ref) {
  final getPlan = ref.read(getExerciseProvider);
  return ExerciseDataNotifier(getPlan);
});

class ExerciseDataNotifier
    extends StateNotifier<AsyncValue<List<ExerciseData>>> {
  final GetExerciseUsecase _useCase;
  List<ExerciseData>? exercises = [];
  List<ExerciseData> filterExData = [];
  ExerciseDataNotifier(this._useCase) : super(const AsyncValue.loading()) {
    getExercises();
  }
//  Whatever(): super(const AsyncValue.loading()) {
//     _fetch();
//   }

  Future<void> getExercises() async {
    try {
      ////http://18.232.174.110/api/exercise/get
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
          exercises = fineData!;
          state = AsyncData(exercises!);
        },
      );
    } catch (e) {
      state =
          AsyncValue.error(e, StackTrace.fromString("Failed to execute list"));
    }
  }

  void packExercise(bool status, ExerciseData obj) {
    var product = exercises?.firstWhere(
      (p) => p.id == obj.id!,
    );
    if (product != null) {
      product.isSelected = status;
      state = AsyncData(exercises!);
    }
    filterExData = exercises!.where((p) => p.isSelected == true).toList();
  }

    List<PackageCollectionBox> getPackedExercise(){
    final data =  exercises!.where((p) => p.isSelected == true).toList();
    List<PackageCollectionBox> sendingData = [];
    data.forEach((obj){
      final pack = PackageCollectionBox(title: "Day 1", subTitle: data.length.toString(), icon: "");
      sendingData.add(pack);
    });
    return sendingData;
 //state = AsyncData(exercises!);
  }
}

class PackageCollectionBox {
 final  String title;
   final String subTitle;
   final String icon;
  PackageCollectionBox({required this.title, required this.subTitle, required this.icon});
}
