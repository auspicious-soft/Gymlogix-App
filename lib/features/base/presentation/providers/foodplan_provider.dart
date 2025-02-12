import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/features/base/data/models/get_food_plan_model.dart';
import 'package:gymlogix/features/base/data/repositories/remote_ds_impl.dart';
import 'package:gymlogix/features/base/domain/usecases/usecase_gym_plan.dart';
import 'package:gymlogix/features/ds_providers/remote_repo_provider.dart';
import 'package:riverpod/src/async_notifier.dart';

import '../../data/datasources/network_error.dart';

/// Provider for the login use case
final foodPlanProvider = Provider<UsecaseGymPlan>((ref) {
  final repository = ref.read(remoteRepositoryProvider);
  return UsecaseGymPlan(fromRemoteRepo: repository);
});
 
final stateFoodPlanProvider =
    StateNotifierProvider<FoodPlanNotifier, AsyncValue<List<FoodPlanData>?>>(
        (ref) {
  final getPlan = ref.read(foodPlanProvider);
  return FoodPlanNotifier(getPlan);
});

 

class FoodPlanNotifier extends StateNotifier<AsyncValue<List<FoodPlanData>?>> {
  final UsecaseGymPlan _planUseCase;

  FoodPlanNotifier(this._planUseCase) : super(const AsyncValue.loading()){
getFoodPlansData();
  }
//  Whatever(): super(const AsyncValue.loading()) {
//     _fetch();
//   }

  Future<void> getFoodPlansData() async {
    try {
      state = const AsyncValue.loading();
      final data = await _planUseCase.getFoodPlans();
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

 