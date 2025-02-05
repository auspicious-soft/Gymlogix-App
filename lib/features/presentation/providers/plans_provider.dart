import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/features/data/models/gymplan_model.dart'; 
import 'package:gymlogix/features/domain/usecases/usecase_gym_plan.dart';
import 'package:gymlogix/features/ds_providers/remote_repo_provider.dart';

/// Provider for the login use case
final getPlansProvider = Provider<UsecaseGymPlan>((ref) {
  final repository = ref.read(remoteRepositoryProvider);
  return UsecaseGymPlan(fromRemoteRepo: repository);
});

/// StateNotifierProvider to handle login logic and state
final stateGetPlanProvider =
    StateNotifierProvider<GetPlanNotifier, AsyncValue<List<GymPlanData>?>>((ref) {
  final getPlan = ref.read(getPlansProvider);
  return GetPlanNotifier(getPlan);
});

class GetPlanNotifier extends StateNotifier<AsyncValue<List<GymPlanData>?>> {
  final UsecaseGymPlan _planUseCase;

  GetPlanNotifier(this._planUseCase) : super(const AsyncValue.loading()){
    getPlanData();
  }

  Future<void> getPlanData() async {
    try {
      state = const AsyncValue.loading();
      final data = await _planUseCase.getAllPlans();
 print("reach here ${data}");
      data.fold(
        (error) {
          state =
              AsyncValue.error(error, StackTrace.fromString("Failed to list"));
        },
        (fineData) {
          print("reach here ${fineData.length}");
          state = AsyncData(fineData);
        },
      );
    } catch (e) {
      // Flushbar(
      //   message: "Error getting plant in: $e",
      //   duration: const Duration(seconds: 2),
      //   flushbarStyle: FlushbarStyle.GROUNDED,
      // ).show(context);
      state =
          AsyncValue.error(e, StackTrace.fromString("Failed to execute list"));
    }
  }



}
