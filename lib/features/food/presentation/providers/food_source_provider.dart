import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/features/food/data/food_ds_impl.dart';
import 'package:gymlogix/features/food/data/models/get_meal_model.dart';
import 'package:gymlogix/features/food/data/repositories/food_repository.dart';
import 'package:gymlogix/features/food/domain/repositories/domain_food_repo.dart';
import 'package:gymlogix/features/food/domain/usecases/food_plan_usecase.dart';
 
import '../../../data/datasources/gymlogix_ds.dart';
import '../../../network/gymlogix_remote.dart';
import '../../data/food_ds.dart';
import '../../domain/repositories/food_repo.dart';


  //DATA SOURCE 
 final _remoteDataSourceProvider = Provider<FoodRepository>((ref) {
  return FoodRepository();
});

final remoteRepositoryProvider = Provider<FoodPlanUseCase>((ref) {
  // final localDataSource = ref.read(remoteDataSourceProvider);
  final remoteDataSource = ref.read(_remoteDataSourceProvider);
  return FoodPlanUseCase(remoteDataSource);
});


 //END


// /// Provider for the login use case
final getMealsProvider = Provider<FoodPlanUseCase>((ref) {
  final repository = ref.read(_remoteDataSourceProvider);
  return FoodPlanUseCase( repository);
});
 
final stateMealItemProvider =
    StateNotifierProvider<MealDataNotifier, AsyncValue<List<MealData>?>>(
        (ref) {
  final getPlan = ref.read(getMealsProvider);
  return MealDataNotifier(getPlan);
});

 

class MealDataNotifier extends StateNotifier<AsyncValue<List<MealData>?>> {
  final FoodPlanUseCase _useCase;

  MealDataNotifier(this._useCase) : super(const AsyncValue.loading()){
getFoodPlansData();
  }
//  Whatever(): super(const AsyncValue.loading()) {
//     _fetch();
//   }

  Future<void> getFoodPlansData() async {
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
          // print("reach here ${fineData?.length}");
          state = AsyncData(fineData);
        },
      );
    } catch (e) {
      state =
          AsyncValue.error(e, StackTrace.fromString("Failed to execute list"));
    }
  }
}
