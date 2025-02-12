import 'dart:async';
 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/features/base/data/models/get_food_plan_model.dart';
import 'package:gymlogix/features/food/data/repositories/explorerepo.dart';
import 'package:gymlogix/features/food/domain/entities/exploreitem.dart'; 
import '../../domain/usecases/food_plan_usecase.dart';
import '../../domain/usecases/usecase_getexploreite.dart';
import 'food_source_provider.dart';
 
 //DATA SOURCE 
 final remoteDataSourceProvider = Provider<ExploreRepository>((ref) {
  return ExploreRepository();
});

final remoteRepositoryProvider = Provider<UsecaseGetexploreite>((ref) {
  // final localDataSource = ref.read(remoteDataSourceProvider);
  final remoteDataSource = ref.read(remoteDataSourceProvider);
  return UsecaseGetexploreite(remoteDataSource);
});


 //END


// /// Provider for the login use case
final getExploreItemProvider = Provider<UsecaseGetexploreite>((ref) {
  final repository = ref.read(remoteDataSourceProvider);
  return UsecaseGetexploreite( repository);
});
 
final stateExploreItemProvider =
    StateNotifierProvider<ExplorePlanNotifier, AsyncValue<List<ExploreItem>?>>(
        (ref) {
  final getPlan = ref.read(getExploreItemProvider);
  return ExplorePlanNotifier(getPlan);
});

 

class ExplorePlanNotifier extends StateNotifier<AsyncValue<List<ExploreItem>?>> {
  final UsecaseGetexploreite _useCase;

  ExplorePlanNotifier(this._useCase) : super(const AsyncValue.loading()){
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

